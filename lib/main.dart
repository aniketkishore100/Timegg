import 'package:egg_timer/egg-timer-controls.dart';
import 'package:egg_timer/egg_timer_dial.dart';
import 'package:egg_timer/egg_timer_display.dart';
import 'package:egg_timer/flat_button_timer.dart';
import 'package:flutter/material.dart';
import 'package:fluttery/animations.dart';
import 'package:fluttery/framing.dart';
import 'package:fluttery/gestures.dart';
import 'package:fluttery/layout.dart';

final Color GRADIENT_TOP = const Color(0xfff5f5f5);
final Color GRADIENT_BOTTOM = const Color(0xffe8e8e8);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Egg Timer',
        theme: ThemeData(fontFamily: 'BebasNeue'),
        home: Scaffold(
          body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [GRADIENT_TOP, GRADIENT_BOTTOM],
            )),
            child: Center(
              child: Column(children: [
                EggTimerTimeDisplay(),
                Container(
                  height: 50,

                ),
                EggTimerDial(),
                Expanded(child: Container()),
                EggTimerControls(),
              ]),
            ),
          ),
        ));
  }
}
