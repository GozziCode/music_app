import 'package:flutter/material.dart';

import '../../../common/color_extension.dart';

class RecommendedCell extends StatelessWidget {
  const RecommendedCell({
    super.key,
    required this.mObj,
  });

  final Map<String, String> mObj;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(9),
            child: Image.asset(
              mObj['image']!,
              width: size.width * .40,
              height: size.height * .13,
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(
          height: size.height * .005,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Text(
            mObj['name']!,
            maxLines: 1,
            style: TextStyle(
                color: TColor.primaryText60,
                fontSize: 13,
                fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Text(
            mObj['artists']!,
            maxLines: 1,
            style: TextStyle(
                color: TColor.secondaryText,
                fontSize: 10,
                fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
