import 'package:flutter/material.dart';

import '../../../common/color_extension.dart';

class AlbumCell extends StatelessWidget {
  final Map aObj;
  final VoidCallback onPressed;
  final Function(int) onPressedMenu;

  const AlbumCell(
      {super.key,
      required this.aObj,
      required this.onPressed,
      required this.onPressedMenu});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Image.asset(
            aObj['image'],
            width: double.maxFinite,
            height: double.maxFinite,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                aObj['name']!,
                maxLines: 1,
                style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            SizedBox(
              width: 12,
              height: 12,
              child: PopupMenuButton(
                onSelected: onPressedMenu,
                elevation: 1,
                offset: const Offset(-10, 15),
                icon: Image.asset(
                  'assets/img/more_btn.png',
                  width: 15,
                  height: 15,
                  color: Colors.white,
                ),
                color: const Color(0xff23273b),
                shadowColor: Colors.black,
                splashRadius: 5,
                padding: EdgeInsets.zero,
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem(
                        height: 30,
                        value: 1,
                        child: Text(
                          'Play',
                          style: TextStyle(fontSize: 12),
                        )),
                    const PopupMenuItem(
                        height: 30,
                        value: 2,
                        child: Text(
                          'Play Next',
                          style: TextStyle(fontSize: 12),
                        )),
                    const PopupMenuItem(
                        height: 30,
                        value: 3,
                        child: Text(
                          'Add to playing queue',
                          style: TextStyle(fontSize: 12),
                        )),
                    const PopupMenuItem(
                        height: 30,
                        value: 4,
                        child: Text(
                          'Add to playlist',
                          style: TextStyle(fontSize: 12),
                        )),
                    const PopupMenuItem(
                        height: 30,
                        value: 5,
                        child: Text(
                          'Rename',
                          style: TextStyle(fontSize: 12),
                        )),
                    const PopupMenuItem(
                        height: 30,
                        value: 6,
                        child: Text(
                          'Tag editor',
                          style: TextStyle(fontSize: 12),
                        )),
                    const PopupMenuItem(
                        height: 30,
                        value: 7,
                        child: Text(
                          'Go to artist',
                          style: TextStyle(fontSize: 12),
                        )),
                    const PopupMenuItem(
                        height: 30,
                        value: 5,
                        child: Text(
                          'Delete from device',
                          style: TextStyle(fontSize: 12),
                        )),
                    const PopupMenuItem(
                        height: 30,
                        value: 5,
                        child: Text(
                          'Share',
                          style: TextStyle(fontSize: 12),
                        )),
                  ];
                },
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                aObj['artists']!,
                maxLines: 1,
                style: TextStyle(
                  color: TColor.lightGray,
                  fontSize: 11,
                ),
              ),
            ),
            Text(
              '•',
              maxLines: 1,
              style: TextStyle(
                  color: TColor.lightGray,
                  fontSize: 11,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              aObj['songs']!,
              maxLines: 1,
              style: TextStyle(
                  color: TColor.lightGray,
                  fontSize: 11,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ],
    );
  }
}
