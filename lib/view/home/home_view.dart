import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/view/home/widgets/playlist_cell.dart';
import 'package:music_app/view/home/widgets/song_row.dart';
import 'package:music_app/view_model/home_view_model.dart';

import 'widgets/view_all_section.dart';
import 'widgets/custom_appbar.dart';
import 'widgets/recommended_cell.dart';
import 'widgets/title_section.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewModel homeVM = Get.put(HomeViewModel());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: customAppBar(context),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleSection(
                title: 'Hot Recommendation',
              ),
              SizedBox(
                height: size.height * .21,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: homeVM.hostRecommendedArr.length,
                  itemBuilder: (context, index) {
                    var mObj = homeVM.hostRecommendedArr[index];
                    return RecommendedCell(mObj: mObj);
                  },
                ),
              ),
              Divider(
                color: Colors.white.withOpacity(0.07),
                indent: 20,
                endIndent: 20,
              ),
              ViewAllSection(
                // buttonTxt: 'View All',
                onPress: () {},
                title: 'Playlist',
              ),
              SizedBox(
                height: size.height * .22,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: homeVM.playListArr.length,
                  itemBuilder: (context, index) {
                    var mObj = homeVM.playListArr[index];
                    return PlaylistCell(mObj: mObj);
                  },
                ),
              ),
              Divider(
                color: Colors.white.withOpacity(0.07),
                indent: 20,
                endIndent: 20,
              ),
              ViewAllSection(
                title: 'Recently Played',
                // buttonTxt: 'View more',
                onPress: () {},
              ),
              SizedBox(
                height: size.height * .24,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: homeVM.recentlyPlayedArr.length,
                  itemBuilder: (context, index) {
                    var sObj = homeVM.recentlyPlayedArr[index];
                    return SongRow(
                      sObj: sObj,
                      onPressPlay: () {},
                      onPressed: () {},
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
