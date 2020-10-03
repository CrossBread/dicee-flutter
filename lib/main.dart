import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
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
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  int total = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      rollDice();
                    },
                    child: Image.asset('images/dice$leftDiceNumber.png'),
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      rollDice();
                    },
                    child: Image.asset('images/dice$rightDiceNumber.png'),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Center(
                          child: Text(
                            '$total',
                            style: TextStyle(
                                color: Colors.red.shade800, fontSize: 80),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: RaisedButton(
                      onPressed: () {
                        rollDice();
                      },
                      child: Text(
                        'Roll',
                        style: TextStyle(color: Colors.white, fontSize: 60),
                      ),
                      color: Colors.redAccent,
                      padding: EdgeInsets.symmetric(vertical: 40),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void rollDice() {
    return setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
      total = leftDiceNumber + rightDiceNumber;
    });
  }
}
