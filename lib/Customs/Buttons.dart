import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  MyButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed(),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  final String text;
  final Function onPressedFunction;
  final double cornerRadius;

  RoundButton(
      {required this.text,
      required this.onPressedFunction,
      required this.cornerRadius});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: 100.0,
      child: ElevatedButton(
        onPressed: () => onPressedFunction(),
        child: Text(text),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cornerRadius),
          ),
        ),
      ),
    );
  }
}
