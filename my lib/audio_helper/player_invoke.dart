import 'dart:async';
import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'mediaitem_converter.dart';
import 'page_manager.dart';
import 'service_locator.dart';

DateTime playerTime = DateTime.now();

bool get isProcessForPlay {
  return DateTime.now().difference(playerTime).inMilliseconds > 600;
}

Timer? debounce;

void playerPlayProcessDebounce(List songList, int index) {
  debounce?.cancel();
  debounce = Timer(const Duration(milliseconds: 100), () {
    PlayerInvoke.init(index: index, songList: songList);
  });
}

class PlayerInvoke {
  static final pageManager = getIt<PageManager>();
  static Future<void> init({
    required List songList,
    required int index,
    bool fromMiniPlayer = false,
    bool shuffle = true,
    String? playListItem,
  }) async {
    final int globalIndex = index < 0 ? 0 : index;
    final List finalList = songList.toList();
    if (shuffle) {
      finalList.shuffle();
    }
    if (fromMiniPlayer) {
      if (!Platform.isAndroid) {
        await pageManager.stop();
      }

      setValues(finalList, globalIndex);
    }
  }

  static Future<void> setValues(List arr, int index,
      {recommend = false}) async {
    final List<MediaItem> queue = [];

    //TODO: Variables not in use

    // final Map playItem = arr[index] as Map;
    // final Map? nextItem =
    //     index == arr.length - 1 ? null : arr[index + 1] as Map;

    queue.addAll(arr.map((song) =>
        MediaItemConverter.mapToMediaItem(song as Map, autoPlay: recommend)));
    updatedPlay(queue, index);
  }

  static Future<void> updatedPlay(List<MediaItem> queue, int index) async {
    try {
      await pageManager.setShuffleMode(AudioServiceShuffleMode.none);
      await pageManager.adds(queue, index);
      await pageManager.playAs();
    } catch (e) {
      debugPrint('error: $e');
    }
  }
}
