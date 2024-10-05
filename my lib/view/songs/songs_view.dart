import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'all_songs_view.dart';
import 'artists_view.dart';
import 'genre_view.dart';
import 'playlist_view.dart';

import '../../common/color_extension.dart';
import '../../view_model/splash_view_model.dart';
import 'albums_view.dart';

class SongsView extends StatefulWidget {
  const SongsView({super.key});

  @override
  State<SongsView> createState() => _SongsViewState();
}

class _SongsViewState extends State<SongsView>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  int selectedTab = 0;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 5, vsync: this);
    controller!.addListener(() {
      selectedTab = controller?.index ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.bg,
        leading: Container(
          margin: const EdgeInsets.only(left: 15.0),
          child: IconButton(
            onPressed: () {
              Get.find<SplashViewModel>().openDrawer();
              FocusScope.of(context).unfocus();
            },
            icon: Image.asset(
              'assets/img/menu.png',
              width: 25,
              height: 25,
              fit: BoxFit.contain,
              color: TColor.primaryText28,
            ),
          ),
        ),
        title: const Text('Songs'),
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
      body: Column(
        children: [
          SizedBox(
            height: kToolbarHeight - 15,
            child: TabBar(
                controller: controller,
                indicatorColor: TColor.focus,
                unselectedLabelColor: TColor.primaryText,
                // indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
                isScrollable: true,
                labelStyle: TextStyle(
                    color: TColor.focus,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
                unselectedLabelStyle: TextStyle(
                    color: TColor.primaryText80,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
                tabs: const [
                  Tab(
                    text: 'All Songs',
                  ),
                  Tab(
                    text: 'Playllists',
                  ),
                  Tab(
                    text: 'Albums',
                  ),
                  Tab(
                    text: 'Artists',
                  ),
                  Tab(
                    text: 'Genre',
                  ),
                ]),
          ),
          Expanded(
              child: TabBarView(controller: controller, children: const [
            AllSongsView(),
            PlaylistView(),
            AlbumsView(),
            ArtistsView(),
            GenreView(),
          ])),
        ],
      ),
    );
  }
}
