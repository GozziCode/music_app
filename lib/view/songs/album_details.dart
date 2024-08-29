import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/view_model/albums_view_model.dart';

import '../../common/color_extension.dart';
import '../../view_model/splash_view_model.dart';
import 'album_song_row.dart';

class AlbumDetailsView extends StatefulWidget {
  const AlbumDetailsView({super.key});

  @override
  State<AlbumDetailsView> createState() => _AlbumDetailsViewState();
}

class _AlbumDetailsViewState extends State<AlbumDetailsView> {
  final albumVM = Get.put(AlbumViewModel());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
            'Album Details',
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
                  Get.find<SplashViewModel>().openDrawer();
                  FocusScope.of(context).unfocus();
                },
                icon: Image.asset(
                  'assets/img/search.png',
                  width: 20,
                  height: 20,
                  fit: BoxFit.contain,
                  color: TColor.primaryText28,
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(children: [
            Stack(
              children: [
                ClipRect(
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Image.asset(
                      'assets/img/alb_1.png',
                      width: double.maxFinite,
                      height: size.width * 0.45,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  color: Colors.black54,
                  width: double.maxFinite,
                  height: size.width * 0.45,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/img/alb_1.png',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          // const SizedBox(
                          //   width: 5,
                          // ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'History',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color:
                                            TColor.primaryText.withOpacity(0.9),
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'by Michael Jackson',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: TColor.primaryText
                                            .withOpacity(0.74),
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    '1996 • 18 Songs • 64 min',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: TColor.primaryText
                                            .withOpacity(0.74),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: 70,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17.5),
                                gradient: LinearGradient(
                                    colors: TColor.primaryG,
                                    begin: Alignment.topCenter,
                                    end: Alignment.center),
                              ),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    'assets/img/play_n.png',
                                    width: 15,
                                    height: 15,
                                    fit: BoxFit.contain,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Play',
                                    style: TextStyle(
                                        fontSize: 10,
                                        color:
                                            TColor.primaryText.withOpacity(0.9),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17.5),
                                    border: Border.all(
                                        color: TColor.primaryText, width: 1),
                                  ),
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        'assets/img/share.png',
                                        width: 15,
                                        height: 15,
                                        fit: BoxFit.contain,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        'Share',
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: TColor.primaryText
                                                .withOpacity(0.9),
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 180,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17.5),
                                    border: Border.all(
                                        color: TColor.primaryText, width: 1),
                                  ),
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        'assets/img/fav.png',
                                        width: 15,
                                        height: 15,
                                        fit: BoxFit.contain,
                                        color: TColor.primaryText,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        'Add to favorite',
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: TColor.primaryText
                                                .withOpacity(0.9),
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: albumVM.playedArr.length,
                itemBuilder: (context, index) {
                  var sObj = albumVM.playedArr[index];
                  return AlbumSongRow(
                    sObj: sObj,
                    onPressPlay: () {},
                    onPressed: () {},
                    isPlay: index == 0,
                  );
                },
              ),
            ),
          ]),
        ));
  }
}
