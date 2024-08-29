import 'package:flutter/material.dart';
import 'package:music_app/common/color_extension.dart';

class GenreCell extends StatelessWidget {
  final Map cObj;
  final VoidCallback onPressed;

  const GenreCell({super.key, required this.cObj, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(cObj['image'],
            width: double.maxFinite,
            height: double.maxFinite,
            fit: BoxFit.cover),
        Container(
          color: Colors.black54,
          width: double.maxFinite,
          height: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                cObj['name'],
                style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 15,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                cObj['songs'],
                style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 12,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
