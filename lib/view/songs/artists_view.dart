import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view_model/artists_view_model.dart';
import 'artist_details_view.dart';
import 'artist_row.dart';

class ArtistsView extends StatefulWidget {
  const ArtistsView({super.key});

  @override
  State<ArtistsView> createState() => _ArtistsViewState();
}

class _ArtistsViewState extends State<ArtistsView> {
  final artistsVM = Get.put(ArtistsViewModel());

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Obx(() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 20),
            itemCount: artistsVM.allList.length,
            itemBuilder: (context, index) {
              var aObj = artistsVM.allList[index];
              return ArtistRow(
                aObj: aObj,
                onPressMenuSelected: (selectedIndex) {},
                onPressed: () {
                  Get.to(() => const ArtistDetailsView());
                },
              );
            }),
      )),
    );
  }
}
