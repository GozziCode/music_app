import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'audio_helper/page_manager.dart';
import 'audio_helper/service_locator.dart';

import 'common/color_extension.dart';
import 'view/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    getIt<PageManager>().init();
  }

  @override
  void dispose() {
    super.dispose();
    getIt<PageManager>().dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Play',
      theme: ThemeData(
        fontFamily: 'Circular Std',
        scaffoldBackgroundColor: TColor.bg,
        textTheme: Theme.of(context).textTheme.apply(
            bodyColor: TColor.primaryText, displayColor: TColor.primaryText),
        colorScheme: ColorScheme.fromSeed(seedColor: TColor.primary),
        useMaterial3: false,
      ),
      home: const SplashView(),
    );
  }
}
