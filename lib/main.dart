import 'package:egg_timer/egg-timer-controls.dart';
import 'package:egg_timer/egg-timer.dart';
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

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  EggTimer eggTimer;
  _MyAppState() {
    eggTimer = new EggTimer(
      maxTime: const Duration(minutes: 35),
      onTimerUpdate: _onTimerUpdate,
    );
  }

  _onTimeSelected(Duration newTime) {
    setState(() {
      eggTimer.currentTime = newTime;
    });
  }

  _onDialStopTurning(Duration newTime) {
    setState(() {
      eggTimer.currentTime = newTime;
      eggTimer.resume();
    });
  }

  _onTimerUpdate() {
    setState(() {});
  }

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
                EggTimerTimeDisplay(
                  eggTimerState: eggTimer.state,
                  selectionTime: eggTimer.lastStartTime,
                  countdownTime: eggTimer.currentTime,
                ),
                Container(
                  height: 50,
                ),
                EggTimerDial(
                  currentTime: eggTimer.currentTime,
                  maxTime: eggTimer.maxTime,
                  ticksPerSection: 5,
                  onTimeSelected: _onTimeSelected,
                  onDialStopTurning: _onDialStopTurning,
                ),
                Expanded(child: Container()),
                EggTimerControls(),
              ]),
            ),
          ),
        ));
  }
}
