import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  //const CalcButton({Key? key}) : super(key: key);

  CalcButton(this.text, this.color, this.textColor, this.press);

  final Function press;
  final String text;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          press(text);
        },
        color: color,
        child: Text(
          text,
          style: TextStyle(fontSize: 35, color: textColor),
        ),
        shape: CircleBorder(),
        padding: EdgeInsets.all(20),
      ),
    );
  }
}
