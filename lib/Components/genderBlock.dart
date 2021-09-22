import 'package:flutter/material.dart';
import '../constants.dart';

class GenderBlock extends StatelessWidget {
  GenderBlock({
    required this.genderIcons,
    required this.gText,
  });

  final IconData genderIcons;
  final String gText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcons,
          size: 80.0,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          gText,
          style: kTextStyleOne,
        )
      ],
    );
  }
}
