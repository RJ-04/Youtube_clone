import 'package:flutter/material.dart';

import '../../../../cores/colors.dart';

class VideoExtraButton extends StatelessWidget {
  final String text;
  final IconData iconData;

  const VideoExtraButton({
    required this.text,
    required this.iconData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: const BoxDecoration(
        color: softBlueGreyBackGround,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Row(
        children: [
          Icon(iconData),
          const SizedBox(width: 5),
          Text(text),
        ],
      ),
    );
  }
}
