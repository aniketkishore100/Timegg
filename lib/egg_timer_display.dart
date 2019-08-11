import 'package:flutter/material.dart';

class EggTimerTimeDisplay extends StatefulWidget {
  @override
  _EggTimerTimeDisplayState createState() => _EggTimerTimeDisplayState();
}

class _EggTimerTimeDisplayState extends State<EggTimerTimeDisplay> {
  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Text(
                  '15:23',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'BebasNeue',
                    fontSize: 100.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                   ),
                ),
              );
  }
}