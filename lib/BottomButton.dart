import 'package:flutter/material.dart';
import 'constants.dart';
import 'results_page.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.text, required this.onTap});

  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(child: Text(text,style: TextStyle(fontSize: 20),)),
        color: kPrimaryButtonColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kCalculateButtonHeight,
      ),
    );
  }
}