import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/view_model/splash_view_model.dart';

import '../../../common/color_extension.dart';
import '../../../view_model/home_view_model.dart';

AppBar customAppBar(context) {
  HomeViewModel homeVM = Get.put(HomeViewModel());

  return AppBar(
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
    title: Container(
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0xff292e4b),
          borderRadius: BorderRadius.circular(18),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
        child: TextFormField(
          textCapitalization: TextCapitalization.sentences,
          maxLines: 1,
          controller: homeVM.txtSearch.value,
          enableSuggestions: true,
          enableIMEPersonalizedLearning: true,
          enableInteractiveSelection: true,
          decoration: InputDecoration(
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            suffixIcon: const Icon(
              Icons.mic_none_rounded,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(width: 0, style: BorderStyle.solid),
            ),
            hintText: 'Search album song',
            hintStyle: TextStyle(color: TColor.primaryText28, fontSize: 13),
            prefixIcon: const Icon(
              Icons.search_rounded,
              size: 22,
            ),
            prefixIconColor: TColor.primaryText28,
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
        )),
  );
}
