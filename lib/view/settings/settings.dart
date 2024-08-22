import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/view/main_tabview/main_tabview.dart';

import '../../common/color_extension.dart';
import '../../view_model/splash_view_model.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
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
        title: const Text('Settings'),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 15.0, top: 10),
            child: IconButton(
              onPressed: () {
                Get.find<SplashViewModel>().openDrawer();
                FocusScope.of(context).unfocus();
              },
              icon: Image.asset(
                'assets/img/search.png',
                width: 25,
                height: 25,
                fit: BoxFit.contain,
                color: TColor.primaryText28,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          DrawerListTile(
              title: 'Display', img: 'assets/img/s_display.png', onTap: () {}),
          DrawerListTile(
              title: 'Audio', img: 'assets/img/s_audio.png', onTap: () {}),
          DrawerListTile(
              title: 'Headset', img: 'assets/img/s_headset.png', onTap: () {}),
          DrawerListTile(
              title: 'Lock Screen',
              img: 'assets/img/s_lock_screen.png',
              onTap: () {}),
          DrawerListTile(
              title: 'Advance', img: 'assets/img/s_menu.png', onTap: () {}),
          DrawerListTile(
              title: 'Others', img: 'assets/img/s_other.png', onTap: () {}),
        ],
      ),
    );
  }
}
