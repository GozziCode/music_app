import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/color_extension.dart';
import '../../../view_model/home_view_model.dart';

AppBar customAppBar() {
  HomeViewModel homeVM = Get.put(HomeViewModel());

  return AppBar(
    backgroundColor: TColor.bg,
    leading: Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: IconButton(
        onPressed: () {},
        icon: Image.asset(
          'assets/img/menu.png',
          width: 25,
          height: 25,
          fit: BoxFit.contain,
          color: TColor.primaryText28,
        ),
      ),
    ),
    title: Row(
      children: [
        Expanded(
          child: Container(
            height: 38,
            decoration: BoxDecoration(
              color: const Color(0xff292e4b),
              borderRadius: BorderRadius.circular(18),
            ),
            child: TextFormField(
              controller: homeVM.txtSearch.value,
              decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  prefixIcon: Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(left: 15),
                    child: Image.asset(
                      'assets/img/search.png',
                      width: 20,
                      height: 20,
                      fit: BoxFit.contain,
                      color: TColor.primaryText28,
                    ),
                  ),
                  hintText: 'Search album song',
                  hintStyle:
                      TextStyle(color: TColor.primaryText28, fontSize: 13)),
            ),
          ),
        ),
      ],
    ),
  );
}
