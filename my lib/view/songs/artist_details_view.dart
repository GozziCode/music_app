import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/widgets/view_all_section.dart';
import 'artist_album_cell.dart';
import '../../view_model/artists_view_model.dart';

import '../../common/color_extension.dart';
import '../../view_model/splash_view_model.dart';
import 'album_song_row.dart';

class ArtistDetailsView extends StatefulWidget {
  const ArtistDetailsView({super.key});

  @override
  State<ArtistDetailsView> createState() => _ArtistDetailsViewState();
}

class _ArtistDetailsViewState extends State<ArtistDetailsView> {
  final artVM = Get.put(ArtistsViewModel());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: TColor.bg,
          title: Text(
            'Artist Details',
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  ClipRect(
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Image.asset(
                        'assets/img/artitst_detail_top.png',
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Dion Bruce',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: TColor.primaryText
                                              .withOpacity(0.9),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      'Pop rock, Funk pop, Heavy Metal',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: TColor.primaryText
                                              .withOpacity(0.74),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '4,357',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color:
                                          TColor.primaryText.withOpacity(0.9),
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  'Followers',
                                  style: TextStyle(
                                      fontSize: 10,
                                      color:
                                          TColor.primaryText60.withOpacity(0.9),
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '128,980',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color:
                                          TColor.primaryText.withOpacity(0.9),
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  'Listiners',
                                  style: TextStyle(
                                      fontSize: 10,
                                      color:
                                          TColor.primaryText60.withOpacity(0.9),
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 70,
                                height: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
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
                                      'Follow',
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
                  ),
                ],
              ),
            ),
            ViewAllSection(title: 'Top Albums', onPress: () {}),
            SizedBox(
              height: size.height * .17,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: artVM.albumsArr.length,
                itemBuilder: (context, index) {
                  var mObj = artVM.albumsArr[index];
                  return ArtistAlbumCell(pObj: mObj);
                },
              ),
            ),
            ViewAllSection(title: 'Top Songs', onPress: () {}),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: artVM.playedArr.length,
                itemBuilder: (context, index) {
                  var sObj = artVM.playedArr[index];
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
