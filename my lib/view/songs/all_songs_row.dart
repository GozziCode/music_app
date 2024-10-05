import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';

class AllSongRow extends StatelessWidget {
  final Map sObj;
  final bool isWeb;
  final VoidCallback onPressPlay;
  final VoidCallback onPressed;

  const AllSongRow({
    super.key,
    required this.sObj,
    required this.onPressPlay,
    required this.onPressed,
    this.isWeb = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: isWeb
                        ? CachedNetworkImage(
                            imageUrl: sObj['image'].toString(),
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) {
                              return Image.asset(
                                'assets/img/playlist_4.png', //TODO: Check for cover image
                                fit: BoxFit.cover,
                              );
                            },
                            placeholder: (context, url) {
                              return Image.asset(
                                'assets/img/playlist_4.png',
                                fit: BoxFit.cover,
                              );
                            },
                            height: 50,
                            width: 50,
                          )
                        : Image.asset(
                            sObj['image'],
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          )),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: TColor.primaryText28),
                      borderRadius: BorderRadius.circular(25)),
                ),
                Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                      color: TColor.bg,
                      borderRadius: BorderRadius.circular(7.5)),
                )
              ],
            ),
            const SizedBox(
              width: 15,
            ),
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
                  sObj['primaryArtists']!,
                  maxLines: 1,
                  style: TextStyle(
                      color: TColor.primaryText28,
                      fontSize: 10,
                      fontWeight: FontWeight.w700),
                ),
              ],
            )),
            IconButton(
                onPressed: onPressPlay,
                icon: Image.asset(
                  'assets/img/play_btn.png',
                  width: 25,
                  height: 25,
                )),
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
