import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

class CustomBtnWidget extends StatelessWidget {
  const CustomBtnWidget({
    Key? key,
    required this.title,
    required this.icon,
    this.iconSize = 28,
    this.textSize = 17,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final double iconSize;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kWhite,
          size: iconSize,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: textSize,
          ),
        )
      ],
    );
  }
}
