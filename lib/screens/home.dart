import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculadora_flutter/helper/memory.dart';
import 'package:calculadora_flutter/screens/calc_button.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Memory memory = Memory();

  _onPressed(String command) {
    setState(() {
      memory.applyCommand(command);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AutoSizeText(
            memory.value,
            minFontSize: 20,
            maxFontSize: 80,
            style: TextStyle(fontSize: 70, color: Colors.white),
            maxLines: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalcButton("AC", Colors.grey, Colors.black, _onPressed),
              CalcButton("*/-", Colors.grey, Colors.black, () {}),
              CalcButton("%", Colors.grey, Colors.black, _onPressed),
              CalcButton("/", Colors.orangeAccent, Colors.white, _onPressed),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalcButton(
                  "7", Colors.grey.withAlpha(900), Colors.white, _onPressed),
              CalcButton(
                  "8", Colors.grey.withAlpha(900), Colors.white, _onPressed),
              CalcButton(
                  "9", Colors.grey.withAlpha(900), Colors.white, _onPressed),
              CalcButton("x", Colors.orangeAccent, Colors.white, _onPressed),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalcButton(
                  "4", Colors.grey.withAlpha(900), Colors.white, _onPressed),
              CalcButton(
                  "5", Colors.grey.withAlpha(900), Colors.white, _onPressed),
              CalcButton(
                  "6", Colors.grey.withAlpha(900), Colors.white, _onPressed),
              CalcButton("-", Colors.orangeAccent, Colors.white, _onPressed),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalcButton(
                  "1", Colors.grey.withAlpha(900), Colors.white, _onPressed),
              CalcButton(
                  "2", Colors.grey.withAlpha(900), Colors.white, _onPressed),
              CalcButton(
                  "3", Colors.grey.withAlpha(900), Colors.white, _onPressed),
              CalcButton("+", Colors.orangeAccent, Colors.white, _onPressed),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                padding: EdgeInsets.fromLTRB(34, 20, 128, 20),
                child: Text(
                  "0",
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
                color: Colors.grey.withAlpha(900),
                onPressed: () {},
                shape: StadiumBorder(),
              ),
              CalcButton(
                  ".", Colors.grey.withAlpha(900), Colors.white, _onPressed),
              CalcButton("=", Colors.orangeAccent, Colors.white, _onPressed)
            ],
          )
        ],
      ),
    );
  }
}
