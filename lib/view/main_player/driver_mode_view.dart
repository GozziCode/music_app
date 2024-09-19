import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/view/main_player/play_playlist_view.dart';
import 'package:music_app/view/songs/playlist_view.dart';

import '../../common/color_extension.dart';

class DriverModeView extends StatefulWidget {
  const DriverModeView({super.key});

  @override
  State<DriverModeView> createState() => _DriverModeViewState();
}

class _DriverModeViewState extends State<DriverModeView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.bg,
        leading: Container(
          margin: const EdgeInsets.only(left: 15.0),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Image.asset(
              'assets/img/close.png',
              width: 25,
              height: 25,
              fit: BoxFit.contain,
              color: TColor.primaryText28,
            ),
          ),
        ),
        title: Text(
          'Driver Mode',
          style: TextStyle(
              fontSize: 17,
              color: TColor.primaryText80,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => const PlaylistView());
            }, //TODO: Used routing
            icon: Image.asset(
              'assets/img/playlist.png',
              width: 25,
              height: 25,
              fit: BoxFit.contain,
              color: TColor.primaryText28,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(media.width * .4),
                      child: Image.asset(
                        'assets/img/player_image.png',
                        width: media.width * .4,
                        height: media.width * .4,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: media.width * .4,
                      height: media.width * .4,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: TColor.primaryText28, width: 2),
                          borderRadius:
                              BorderRadius.circular(media.width * .2)),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  '3:15|4:26',
                  style: TextStyle(
                      color: TColor.secondaryText,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  'Black or White',
                  style: TextStyle(
                      color: TColor.primaryText.withOpacity(.9),
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Michael Jackson | Album - Dangerious ',
                  style: TextStyle(
                      color: TColor.secondaryText,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/img/eq_display.png',
                  height: 60,
                  fit: BoxFit.fitHeight,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Divider(
                    color: Colors.white12,
                    height: 1,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/img/previous_song.png',
                          width: 35,
                          height: 35,
                        )),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/img/play.png',
                          )),
                    ),
                    const SizedBox(height: 15),
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/img/next_song.png',
                          width: 35,
                          height: 35,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PlayerBottomButton(
                      icon: 'assets/img/playlist.png',
                      title: 'Playlist',
                      onPressed: () {
                        if (kDebugMode) {
                          print('i got tapped');
                        }
                        Get.to(() => const PlayPlaylistView());
                      },
                    ),
                    PlayerBottomButton(
                      icon: 'assets/img/shuffle.png',
                      title: 'Shuffle',
                      onPressed: () {},
                    ),
                    PlayerBottomButton(
                      icon: 'assets/img/repeat.png',
                      title: 'Repeat',
                      onPressed: () {},
                    ),
                    PlayerBottomButton(
                      icon: 'assets/img/eq.png',
                      title: 'EQ',
                      onPressed: () {},
                    ),
                    PlayerBottomButton(
                      icon: 'assets/img/fav.png',
                      title: 'Favourites',
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PlayerBottomButton extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onPressed;
  const PlayerBottomButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          IconButton(
              onPressed: onPressed,
              icon: Image.asset(
                icon,
                color: TColor.primaryText80,
                width: 30,
                height: 30,
              )),
          Text(
            title,
            style: TextStyle(
                color: TColor.secondaryText,
                fontSize: 12,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
