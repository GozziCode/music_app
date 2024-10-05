import 'package:flutter/material.dart';

import '../../../common/color_extension.dart';

class ViewAllSection extends StatelessWidget {
  final String title;
  // final String buttonTxt;
  final VoidCallback onPress;
  const ViewAllSection({
    super.key,
    required this.title,
    // required this.buttonTxt,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
                color: TColor.primaryText80,
                fontSize: 15,
                fontWeight: FontWeight.w600),
          ),
        ),
        TextButton(
          onPressed: onPress,
          child: Text(
            'View All',
            style: TextStyle(
              color: TColor.org,
              fontSize: 11,
            ),
          ),
        )
      ],
    );
  }
}
