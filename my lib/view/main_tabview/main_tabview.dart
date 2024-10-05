// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../home/home_view.dart';
import '../settings/settings.dart';
import '../../view_model/splash_view_model.dart';

import '../../common/color_extension.dart';
import '../../common_widgets/mini_player.dart';
import '../songs/songs_view.dart';

class MainTabview extends StatefulWidget {
  const MainTabview({super.key});

  @override
  State<MainTabview> createState() => _MainTabviewState();
}

class _MainTabviewState extends State<MainTabview>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: TColor.drawerBg,
      //  Color.fromARGB(255, 17, 20, 33),
    ));
    tabController = TabController(length: 3, vsync: this);
    tabController!.addListener(() {
      selectedIndex = tabController!.index;
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    var splashVM = Get.find<SplashViewModel>();
    return Scaffold(
      key: splashVM.scaffoldKey,
      drawer: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Drawer(
          backgroundColor: TColor.drawerBg,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: size.height * .27,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                      color: TColor.primaryText.withOpacity(0.03)),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/img/app_logo.png',
                        width: size.width * .15,
                      ),
                      SizedBox(
                        height: size.height * .02,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            '328\nSongs',
                            style: TextStyle(
                                color: Color(0xffc1c0c0), fontSize: 12),
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            '328\nAlbums',
                            style: TextStyle(
                                color: Color(0xffc1c0c0), fontSize: 12),
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            '328\nArtists',
                            style: TextStyle(
                                color: Color(0xffc1c0c0), fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              DrawerListTile(
                img: 'assets/img/m_theme.png',
                title: 'Themes',
                onTap: () {
                  splashVM.closeDrawer();
                },
              ),
              DrawerListTile(
                img: 'assets/img/m_ring_cut.png',
                title: 'Ringtone Cutter',
                onTap: () {
                  splashVM.closeDrawer();
                },
              ),
              DrawerListTile(
                img: 'assets/img/m_sleep_timer.png',
                title: 'Sleep Timer',
                onTap: () {
                  splashVM.closeDrawer();
                },
              ),
              DrawerListTile(
                img: 'assets/img/m_eq.png',
                title: 'Equalizer',
                onTap: () {
                  splashVM.closeDrawer();
                },
              ),
              DrawerListTile(
                img: 'assets/img/m_driver_mode.png',
                title: 'Driver Mode',
                onTap: () {
                  splashVM.closeDrawer();
                },
              ),
              DrawerListTile(
                img: 'assets/img/m_hidden_folder.png',
                title: 'Hidden Folders',
                onTap: () {
                  splashVM.closeDrawer();
                },
              ),
              DrawerListTile(
                img: 'assets/img/m_scan_media.png',
                title: 'Scan Media',
                onTap: () {
                  splashVM.closeDrawer();
                },
              ),
            ],
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            TabBarView(
                controller: tabController,
                children: const [HomeView(), SongsView(), SettingsView()]),
            MiniPlayerView(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: TColor.focus, width: 2)),
          color: TColor.bg,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: BottomAppBar(
          color: Colors.transparent,
          child: TabBar(
              splashBorderRadius: const BorderRadius.all(Radius.circular(25)),
              // splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
              indicator: const BoxDecoration(),
              controller: tabController,
              tabs: [
                Tab(
                  text: 'Home',
                  icon: Image.asset(
                    selectedIndex == 0
                        ? 'assets/img/home_tab.png'
                        : 'assets/img/home_tab_un.png',
                    width: 20,
                    height: 20,
                  ),
                ),
                Tab(
                  text: 'Song',
                  icon: Image.asset(
                    selectedIndex == 1
                        ? 'assets/img/songs_tab.png'
                        : 'assets/img/songs_tab_un.png',
                    width: 20,
                    height: 20,
                  ),
                ),
                Tab(
                  text: 'Settings',
                  icon: Image.asset(
                    selectedIndex == 2
                        ? 'assets/img/setting_tab.png'
                        : 'assets/img/setting_tab_un.png',
                    width: 20,
                    height: 20,
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final String img, title;
  final VoidCallback onTap;
  const DrawerListTile({
    super.key,
    required this.title,
    required this.img,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: Image.asset(
            img,
            width: 25,
            height: 25,
            fit: BoxFit.contain,
          ),
          title: Text(
            title,
            style: TextStyle(
                color: TColor.primaryText.withOpacity(0.9),
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
          onTap: onTap,
        ),
        Divider(
          color: TColor.primaryText.withOpacity(0.07),
          indent: 20,
          endIndent: 20,
        )
      ],
    );
  }
}
