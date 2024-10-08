import 'package:flutter/material.dart';

import '../../common/color_extension.dart';

class ArtistRow extends StatelessWidget {
  final Map aObj;
  final Function(int select) onPressMenuSelected;
  final VoidCallback onPressed;

  const ArtistRow(
      {super.key,
      required this.aObj,
      required this.onPressMenuSelected,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onPressed,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipRect(
                    child: Image.asset(
                  aObj['image'],
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                )),
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    border: Border.all(color: TColor.primaryText28),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  aObj['name']!,
                  maxLines: 1,
                  style: TextStyle(
                      color: TColor.primaryText,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                Text(
                  '${aObj['artists']} \t•\t${aObj['songs']}',
                  maxLines: 1,
                  style: TextStyle(
                      color: TColor.primaryText80,
                      fontSize: 11,
                      fontWeight: FontWeight.w700),
                ),
              ],
            )),
            SizedBox(
              width: 25,
              height: 25,
              child: PopupMenuButton(
                onSelected: onPressMenuSelected,
                elevation: 1,
                offset: const Offset(-10, 15),
                icon: Image.asset(
                  'assets/img/more_btn.png',
                  width: 20,
                  height: 20,
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
      ),
    );
  }
}
