import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/view/main_player/play_playlist_view.dart';

import '../../common/color_extension.dart';

class DriverModeView extends StatefulWidget {
  const DriverModeView({super.key});

  @override
  State<DriverModeView> createState() => _DriverModeViewState();
}

class _DriverModeViewState extends State<DriverModeView> {
  var sliderVal = 0.7;
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
              width: 20,
              height: 20,
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
              Get.to(() => const PlayPlaylistView());
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
                  height: 50,
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
                      color: TColor.primaryText60,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  '232/232',
                  style: TextStyle(
                    color: TColor.primaryText60,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Slider(
                    value: sliderVal,
                    activeColor: TColor.focus,
                    inactiveColor: TColor.primaryText28,
                    onChanged: (newVal) {
                      setState(() {
                        sliderVal = newVal;
                      });
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '3:35',
                        style: TextStyle(
                          color: TColor.primaryText60,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        '4:55',
                        style: TextStyle(
                          color: TColor.primaryText60,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/img/previous_song.png',
                            width: 60,
                            height: 60,
                          )),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: 80,
                        height: 80,
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
                            width: 60,
                            height: 60,
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
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
