import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

Future<AudioHandler> initAudioService() async {
  return await AudioService.init(
      builder: () => MyAudioHandler(),
      config: AudioServiceConfig(
          androidNotificationChannelId: "com.example.music_app.channel.audio",
          androidNotificationChannelName: "music_app",
          androidNotificationIcon: '@drawable/ic_stat_music_note',
          androidShowNotificationBadge: true,
          androidStopForegroundOnPause: true,
          notificationColor: Colors.grey[900]));
}

abstract class AudioPlayerHandler implements AudioHandler {
  Future<void> setNewPlayList(List<MediaItem> mediaItems, int index);
  Future<void> moveQueueItem(int currentIndex, int index);
  Future<void> removeQueueItemIndex(int index);
}

class MyAudioHandler extends BaseAudioHandler implements AudioPlayerHandler {
  final player = AudioPlayer();
  final playList =
      ConcatenatingAudioSource(children: [], useLazyPreparation: true);
  late List<int> preferredCompactNotification = [123];
  MyAudioHandler() {
    loadEmptyPlayList();
    notifyAudioHandlerAboutPlayerbackEvents();
    listenForDurationChanges();
    listenForCurrentSongIndexChanges();
    listenForSequenceStateChanges();
  }

  Future<void> loadEmptyPlayList() async {
    try {
      preferredCompactNotification = [0, 1, 2];
      await player.setAudioSource(playList);
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  Future<void> notifyAudioHandlerAboutPlayerbackEvents() async {
    player.playbackEventStream.listen((event) {
      final playing = player.playing;
      playbackState.add(PlaybackState(
          controls: [
            MediaControl.skipToPrevious,
            MediaControl.skipToNext,
            MediaControl.stop,
            if (playing) MediaControl.pause else MediaControl.play,
          ],
          systemActions: <MediaAction>{
            MediaAction.seek,
            // MediaAction.seekForward,
            // MediaAction.seekBackward
          },
          androidCompactActionIndices: const [
            0,
            1,
            3
          ],
          processingState: {
            ProcessingState.idle: AudioProcessingState.idle,
            ProcessingState.loading: AudioProcessingState.loading,
            ProcessingState.buffering: AudioProcessingState.buffering,
            ProcessingState.ready: AudioProcessingState.ready,
            ProcessingState.completed: AudioProcessingState.completed
          }[player.processingState]!,
          repeatMode: {
            LoopMode.off: AudioServiceRepeatMode.none,
            LoopMode.one: AudioServiceRepeatMode.one,
            LoopMode.all: AudioServiceRepeatMode.all,
          }[player.loopMode]!,
          shuffleMode: player.shuffleModeEnabled
              ? AudioServiceShuffleMode.all
              : AudioServiceShuffleMode.none,
          playing: playing,
          updatePosition: player.position,
          bufferedPosition: player.bufferedPosition,
          speed: player.speed,
          queueIndex: event.currentIndex));
    });
  }

  Future<void> listenForDurationChanges() async {
    player.durationStream.listen((duration) {
      var index = player.currentIndex;
      final newQueue = queue.value;
      if (index == null || newQueue.isEmpty || newQueue.length < index) return;
      if (player.shuffleModeEnabled) {
        index = player.shuffleIndices!.indexOf(index);
      }
      final oldMediaItem = newQueue[index];
      final newMediaItem = oldMediaItem.copyWith(duration: duration);
      newQueue[index] = newMediaItem;
      queue.add(newQueue);
      mediaItem.add(newMediaItem);
    });
  }

  Future<void> listenForCurrentSongIndexChanges() async {
    player.currentIndexStream.listen((index) {
      final pPlaylist = queue.value;
      if (index == null || pPlaylist.isEmpty) return;
      if (player.shuffleModeEnabled) {
        index = player.shuffleIndices!.indexOf(index);
      }
      mediaItem.add(pPlaylist[index]);
    });
  }

  Future<void> listenForSequenceStateChanges() async {
    player.sequenceStateStream.listen((sequenceState) {
      final sequence = sequenceState?.effectiveSequence;
      if (sequence == null || sequence.isEmpty) return;
      final items = sequence.map((source) => source.tag as MediaItem);
      queue.add(items.toList());
    });
  }

  @override
  Future<void> addQueueItem(MediaItem mediaItem) async {
    final audioSource = createAudioSource(mediaItem);
    await playList.add(audioSource);
    final newQueue = queue.value..add(mediaItem);
    queue.add(newQueue);
  }

  @override
  Future<void> addQueueItems(List<MediaItem> mediaItems) async {
    final audioSource = createAudioSources(mediaItems);
    await playList.addAll(audioSource);
    final newQueue = queue.value..addAll(mediaItems);
    queue.add(newQueue);
  }

  @override
  Future<void> updateMediaItem(MediaItem mediaItem) async {
    final index = queue.value.indexWhere((item) => item.id == mediaItem.id);
    var dataArr = queue.value;
    dataArr[index] = mediaItem;
    queue.add(dataArr);
  }

  @override
  Future<void> updateQueue(List<MediaItem> queue) async {
    await playList.clear();
    await playList.addAll(createAudioSources(queue));
  }

  @override
  Future<void> moveQueueItem(int currentIndex, int newIndex) async {
    await playList.move(currentIndex, newIndex);
  }

  UriAudioSource createAudioSource(MediaItem mediaItem) {
    return AudioSource.uri(Uri.parse(mediaItem.extras!['url'] as String),
        tag: mediaItem);
  }

  List<UriAudioSource> createAudioSources(List<MediaItem> mediaItem) {
    return mediaItem
        .map((item) => AudioSource.uri(Uri.parse(item.extras!['url'] as String),
            tag: item))
        .toList();
  }

  @override
  Future<void> removeQueueItemAt(int index) async {
    await playList.removeRange(0, index);
    final newQueue = queue.value..clear();
    queue.add(newQueue);
  }

  @override
  Future<void> play() async {
    await player.play();
  }

  @override
  Future<void> pause() async {
    await player.pause();
  }

  @override
  Future<void> seek(Duration position) async {
    await player.seek(position);
  }

  @override
  Future<void> skipToQueueItem(int index) async {
    if (index < 0 || index >= queue.value.length) return;
    if (player.shuffleModeEnabled) {
      index = player.shuffleIndices![index];
    }
    player.seek(Duration.zero, index: index);
  }

  @override
  Future<void> skipToNext() async {
    await player.seekToNext();
  }

  @override
  Future<void> skipToPrevious() async {
    await player.seekToPrevious();
  }

  @override
  Future<void> setRepeatMode(AudioServiceRepeatMode repeatMode) async {
    switch (repeatMode) {
      case AudioServiceRepeatMode.none:
        player.setLoopMode(LoopMode.off);
        break;
      case AudioServiceRepeatMode.one:
        player.setLoopMode(LoopMode.one);
        break;
      case AudioServiceRepeatMode.group:
      case AudioServiceRepeatMode.all:
        player.setLoopMode(LoopMode.all);
        break;
    }
  }

  @override
  Future<void> setShuffleMode(AudioServiceShuffleMode shuffleMode) async {
    if (shuffleMode == AudioServiceShuffleMode.none) {
      player.setShuffleModeEnabled(false);
    } else {
      player.shuffle();
      player.setShuffleModeEnabled(true);
    }
  }

  @override
  Future customAction(String name, [Map<String, dynamic>? extras]) async {
    if (name == 'dispose') {
      await player.dispose();
      super.stop();
    }
  }

  @override
  Future<void> stop() async {
    await player.stop();
    playbackState.add(playbackState.value
        .copyWith(processingState: AudioProcessingState.idle));
    return super.stop();
  }

  @override
  Future<void> removeQueueItemIndex(int index) async {
    await playList.removeAt(index);
  }

  @override
  Future<void> setNewPlayList(List<MediaItem> mediaItems, int index) async {
    if (Platform.isAndroid) {
      await player.stop();
    }

    var getCount = queue.value.length;
    await playList.removeRange(0, getCount);
    final audioSource = createAudioSources(mediaItems);
    await playList.addAll(audioSource);
    final newQueue = queue.value..addAll(mediaItems);
    queue.add(newQueue);
    await player.setAudioSource(playList,
        initialIndex: index, initialPosition: Duration.zero);
  }
}
