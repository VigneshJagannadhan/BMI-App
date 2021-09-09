import 'package:flutter/material.dart';
import 'InputPage.dart';


class ReusableCard extends StatelessWidget {
  ReusableCard({required this.colour, required this.customCard});
  final Color colour;
  final Widget customCard;
  // reusableCard({@required this.colour})
  // final Color colour;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: customCard,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: colour,
      ),
      margin: EdgeInsets.all(15),
    );
  }
}
