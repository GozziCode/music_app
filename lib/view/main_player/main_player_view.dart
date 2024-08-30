import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../../common/color_extension.dart';

class MainPlayerView extends StatefulWidget {
  const MainPlayerView({super.key});

  @override
  State<MainPlayerView> createState() => _MainPlayerViewState();
}

class _MainPlayerViewState extends State<MainPlayerView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.bg,
        // leading: Container(
        //   margin: const EdgeInsets.only(left: 15.0),
        //   child: IconButton(
        //     onPressed: () {
        //       Get.find<SplashViewModel>().openDrawer();
        //       FocusScope.of(context).unfocus();
        //     },
        //     icon: Image.asset(
        //       'assets/img/menu.png',
        //       width: 25,
        //       height: 25,
        //       fit: BoxFit.contain,
        //       color: TColor.primaryText28,
        //     ),
        //   ),
        // ),
        title: Text(
          'Now Playing',
          style: TextStyle(
              fontSize: 17,
              color: TColor.primaryText80,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 15.0, top: 5),
            child: IconButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
              },
              icon: PopupMenuButton(
                  onSelected: (value){},
                  elevation: 1,
                  offset: const Offset(-10, 15),
                  icon: Image.asset(
                    'assets/img/more_btn.png',
                    width: 20,
                    height: 20,
                    color: Colors.white,
                  ),
                  color: const Color(0xff23273b),
                  shadowColor: Colors.black,
                  splashRadius: 5,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context) {
                    return [
                      const PopupMenuItem(
                          height: 30,
                          value: 1,
                          child: Text(
                            'Social Share',
                            style: TextStyle(fontSize: 12),
                          )),
                      const PopupMenuItem(
                          height: 30,
                          value: 2,
                          child: Text(
                            'Play Queue',
                            style: TextStyle(fontSize: 12),
                          )),
                      const PopupMenuItem(
                          height: 30,
                          value: 3,
                          child: Text(
                            'Add to playlist...',
                            style: TextStyle(fontSize: 12),
                          )),
                      const PopupMenuItem(
                          height: 30,
                          value: 4,
                          child: Text(
                            'Lyrics',
                            style: TextStyle(fontSize: 12),
                          )),
                      const PopupMenuItem(
                          height: 30,
                          value: 5,
                          child: Text(
                            'Volume',
                            style: TextStyle(fontSize: 12),
                          )),
                      const PopupMenuItem(
                          height: 30,
                          value: 6,
                          child: Text(
                            'Details',
                            style: TextStyle(fontSize: 12),
                          )),
                      const PopupMenuItem(
                          height: 30,
                          value: 7,
                          child: Text(
                            'Sleep timer',
                            style: TextStyle(fontSize: 12),
                          )),
                      const PopupMenuItem(
                          height: 30,
                          value: 5,
                          child: Text(
                            'Equalizer',
                            style: TextStyle(fontSize: 12),
                          )),
                      const PopupMenuItem(
                          height: 30,
                          value: 5,
                          child: Text(
                            'Driver Mode',
                            style: TextStyle(fontSize: 12),
                          )),
                    ];
                  },
                ),
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
                      borderRadius: BorderRadius.circular(media.width * .7),
                      child: Image.asset(
                        'assets/img/player_image.png',
                        width: media.width * .6,
                        height: media.width * .6,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: media.width * .61,
                      height: media.width * .61,
                      child: SleekCircularSlider(
                          appearance: CircularSliderAppearance(
                            // startAngle: 0,
                            angleRange: 360,
                            customWidths: CustomSliderWidths(
                                trackWidth: 4,
                                progressBarWidth: 8,
                                shadowWidth: 8),
                            customColors: CustomSliderColors(
                                dotColor: const Color(0xffffb1b2),
                                trackColor:
                                    const Color(0xffffffff).withOpacity(0.2),
                                progressBarColors: [
                                  const Color(0x0ffb9967),
                                  const Color(0xffe9585a)
                                ],
                                shadowColor: const Color(0x0fffb1b2),
                                shadowMaxOpacity: 0.05),
                            infoProperties: InfoProperties(
                              topLabelStyle: const TextStyle(
                                  color: Colors.transparent,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                              topLabelText: 'Elapseo',
                              bottomLabelStyle: const TextStyle(
                                  color: Colors.transparent,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                              bottomLabelText: 'Time',
                              mainLabelStyle: const TextStyle(
                                  color: Colors.transparent,
                                  fontSize: 50,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          min: 0,
                          max: 100,
                          onChange: (double value) {},
                          onChangeEnd: (double endValue) {},
                          initialValue: 42.6),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PlayerBottomButton(icon: 'assets/img/playlist.png',title: 'Playlist', onPressed: (){},),
                    PlayerBottomButton(icon: 'assets/img/shuffle.png',title: 'Shuffle', onPressed: (){},),
                    PlayerBottomButton(icon: 'assets/img/repeat.png',title: 'Repeat', onPressed: (){},),
                    PlayerBottomButton(icon: 'assets/img/eq.png',title: 'EQ', onPressed: (){},),
                    PlayerBottomButton(icon: 'assets/img/fav.png',title: 'Favourites', onPressed: (){},),
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
    super.key, required this.title, required this.icon, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          IconButton(
              onPressed: () {},
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
