import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_app/view/home/home_view.dart';

import '../../common/color_extension.dart';

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
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Color.fromARGB(255, 17, 20, 33),
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
    return Scaffold(
      body: TabBarView(
          controller: tabController,
          children: [const HomeView(), Container(), Container()]),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: TColor.focus, width: 2)),
          color: TColor.bg,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          // boxShadow: const [
          //   BoxShadow(blurRadius: 0, offset: Offset(0, -3)),
          // ]
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
                  text: 'Home',
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
