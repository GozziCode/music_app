import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:music_app/view/home/widgets/view_all_section.dart';
import 'package:music_app/view/songs/playlist_song_cell.dart';
import 'package:music_app/view_model/playlists_view_model.dart';

import 'my_playlist_cell.dart';

class PlaylistView extends StatefulWidget {
  const PlaylistView({super.key});

  @override
  State<PlaylistView> createState() => _PlaylistViewState();
}

class _PlaylistViewState extends State<PlaylistView> {
  final plVM = Get.put(PlaylistsViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xff23273b),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Image.asset('assets/img/add.png'),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Obx(() => GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.4,
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 0),
                    itemCount: plVM.playlistArr.length,
                    itemBuilder: (context, index) {
                      var pObj = plVM.playlistArr[index];
                      return PlayLlistSongCell(
                          pObj: pObj, 
                          onPressed: () {}, 
                          onPressedPlay: () {});
                    },
                  )),
              ViewAllSection(title: 'My Playlist', onPress: () {}),
              SizedBox(
                height: 150,
                child: Obx(
                  () => ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: plVM.myPlaylistArr.length,
                    itemBuilder: (context, index) {
                      var pObj = plVM.myPlaylistArr[index];

                      return MyPlaylistCell(
                        onPressed: () {},
                        pObj: pObj,
                      );
                    },
                  ),
                ),
              )
            ]),
          ),
        ));
  }
}
