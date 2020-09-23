import 'package:flutter/material.dart';
import 'diceroller.dart';

DiceRoller diceroller = DiceRoller();

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        appBar: AppBar(
          title: Center(
            child: Text('5-Dice Roll'),
          ),
          backgroundColor: Colors.deepPurple,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                diceroller.getRollStatus(),
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      diceroller.changeDiceFace();
                    });
                  },
                  child: Image.asset('images/dice' +
                      diceroller.getDiceValue(1).toString() +
                      '.png'),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      diceroller.changeDiceFace();
                    });
                  },
                  child: Image.asset('images/dice' +
                      diceroller.getDiceValue(2).toString() +
                      '.png'),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  setState(() {
                    diceroller.changeDiceFace();
                  });
                },
                child: Image.asset(
                    'images/dice' +
                        diceroller.getDiceValue(5).toString() +
                        '.png',
                    width: 175.0,
                    height: 175.0),
              ),
            ],
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    diceroller.changeDiceFace();
                  });
                },
                child: Image.asset('images/dice' +
                    diceroller.getDiceValue(3).toString() +
                    '.png'),
              ),
            ),
            Expanded(
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    diceroller.changeDiceFace();
                  });
                },
                child: Image.asset('images/dice' +
                    diceroller.getDiceValue(4).toString() +
                    '.png'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
