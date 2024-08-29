import 'package:flutter/material.dart';

import '../../../common/color_extension.dart';

class ArtistAlbumCell extends StatelessWidget {
  final Map pObj;
  // final VoidCallback onPressed;

  const ArtistAlbumCell({
    super.key,
    required this.pObj,
    // required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(9),
              child: Image.asset(
                pObj['image'],
                width: 90, //TODO:1
                height: 80,
                fit: BoxFit.cover,
              )),
          const SizedBox(
            width: 8,
          ),
          Text(
            pObj['name']!,
            maxLines: 1,
            style: TextStyle(
                color: TColor.primaryText60,
                fontSize: 13,
                fontWeight: FontWeight.w700),
          ),
          Text(
            pObj['year']!,
            maxLines: 1,
            style: TextStyle(
                color: TColor.primaryText35,
                fontSize: 10,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
