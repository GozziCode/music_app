import 'package:flutter/material.dart';

import '../../common/color_extension.dart';

class PlayLlistSongCell extends StatelessWidget {
  final Map pObj;
  final VoidCallback onPressed;
  final VoidCallback onPressedPlay;

  const PlayLlistSongCell(
      {super.key,
      required this.pObj,
      required this.onPressed,
      required this.onPressedPlay});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(
          pObj['image'],
          width: double.maxFinite,
          height: double.maxFinite,
          fit: BoxFit.cover,
        ),
        Container(
          width: double.maxFinite,
          height: double.maxFinite,
          color: Colors.black45,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    pObj['name']!,
                    maxLines: 1,
                    style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    pObj['songs']!,
                    maxLines: 1,
                    style: TextStyle(
                        color: TColor.primaryText28,
                        fontSize: 11,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              )),
              GestureDetector(
                  onTap: onPressedPlay,
                  child: Image.asset(
                    'assets/img/play.png',
                    width: 22,
                    height: 22,
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
