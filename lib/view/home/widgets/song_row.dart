import 'package:flutter/material.dart';

import '../../../common/color_extension.dart';

class SongRow extends StatelessWidget {
  final Map sObj;
  final VoidCallback onPressPlay;
  final VoidCallback onPressed;

  const SongRow(
      {super.key,
      required this.sObj,
      required this.onPressPlay,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/img/play_btn.png',
                  width: 25,
                  height: 25,
                )),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sObj['name']!,
                  maxLines: 1,
                  style: TextStyle(
                      color: TColor.primaryText60,
                      fontSize: 13,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  sObj['artists']!,
                  maxLines: 1,
                  style: TextStyle(
                      color: TColor.secondaryText,
                      fontSize: 10,
                      fontWeight: FontWeight.w700),
                ),
              ],
            )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite,
                  color: TColor.lightGray.withOpacity(0.3),
                ))
            // Image.asset(
            //   'assets/img/fav.png',
            //   width: 20,
            //   height: 20,
            // )
          ],
        ),
        Divider(
          color: Colors.white.withOpacity(0.07),
          indent: 10,
        ),
      ],
    );
  }
}
