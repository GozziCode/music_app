import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/color_extension.dart';
import '../../view_model/splash_view_model.dart';

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
              icon: Image.asset(
                'assets/img/more_btn.png',
                width: 20,
                height: 20,
                fit: BoxFit.contain,
                color: TColor.primaryText80,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
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
                  )
                ],
              ),
              const Row(
                children: [],
              )
            ],
          ),
        ),
      ),
    );
  }
}
