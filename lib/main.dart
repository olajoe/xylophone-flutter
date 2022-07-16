import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  var keyColors = [
    Colors.red,
    Colors.white,
    Colors.amberAccent,
    Colors.tealAccent,
    Colors.brown,
    Colors.pinkAccent,
    Colors.lightGreen
  ];

  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  Expanded buildKeyUI({required int soundNumber, required Color color}) =>
      Expanded(
        child: TextButton(
          onPressed: () {
            playSound(soundNumber);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
          ),
          child: const Text("Click me!"),
        ),
      );

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: keyColors.asMap().entries.map((e) {
              int index = e.key + 1;
              Color color = e.value;
              return buildKeyUI(soundNumber: index, color: color);
            }).toList(),
          ),
        ),
      ),
    );
  }
}
