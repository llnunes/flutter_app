import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {

  String text;
  Function onPressed;
  Color color;
  Color textColor;

  BlueButton(this.text, {@required this.onPressed, this.color = Colors.blue, this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: color,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
