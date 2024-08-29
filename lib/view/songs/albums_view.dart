import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/view/songs/album_cell.dart';
import 'package:music_app/view/songs/album_details.dart';
import 'package:music_app/view_model/albums_view_model.dart';

class AlbumsView extends StatefulWidget {
  const AlbumsView({super.key});

  @override
  State<AlbumsView> createState() => _AlbumsViewState();
}

class _AlbumsViewState extends State<AlbumsView> {
  final albumVM = Get.put(AlbumViewModel());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double cellWidth = (size.width - 40 - 20) * 0.5;
    return Scaffold(
      body: Obx(() => GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: cellWidth / (cellWidth + 50),
            mainAxisSpacing: 20,
            // mainAxisExtent: 20,
            crossAxisSpacing: 10,
          ),
          itemCount: albumVM.allList.length,
          itemBuilder: (context, index) {
            var aObj = albumVM.allList[index];
            return AlbumCell(
              onPressed: () {
                Get.to(() => const AlbumDetailsView());
              },
              onPressedMenu: (selectedIndex) {},
              aObj: aObj,
            );
          })),
    );
  }
}
