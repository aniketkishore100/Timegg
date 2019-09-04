import 'package:egg_timer/egg-timer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EggTimerTimeDisplay extends StatefulWidget {
  final eggTimerState;
  final selectionTime;
  final countdownTime;

  EggTimerTimeDisplay({
    this.eggTimerState,
    this.selectionTime = const Duration(seconds: 0),
    this.countdownTime = const Duration(seconds: 0),
  });
  @override
  _EggTimerTimeDisplayState createState() => _EggTimerTimeDisplayState();
}

class _EggTimerTimeDisplayState extends State<EggTimerTimeDisplay> {
  final DateFormat selectionTimeFormat = DateFormat('mm');
  final DateFormat countdownTimeFormat = DateFormat('mm:ss');

  get formattedSelectionTime {
    DateTime dateTime = DateTime(
        DateTime.now().year, 0, 0, 0, 0, widget.selectionTime.inSeconds);
    return selectionTimeFormat.format(dateTime);
  }

  get formattedCountdownTime {
    DateTime dateTime = DateTime(
        DateTime.now().year, 0, 0, 0, 0, widget.countdownTime.inSeconds);
    return countdownTimeFormat.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform(
            transform: Matrix4.translationValues(
                0, widget.eggTimerState == EggTimerState.ready ? 0.0 : -200, 0),
            child: Text(
              formattedSelectionTime,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'BebasNeue',
                fontSize: 100.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
          ),
          Opacity(
            opacity: widget.eggTimerState != EggTimerState.ready ? 1.0 : 0.0,
            child: Text(
              formattedCountdownTime,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'BebasNeue',
                fontSize: 100.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
