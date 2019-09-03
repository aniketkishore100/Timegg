import 'package:egg_timer/egg_timer_knob.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:fluttery/gestures.dart';

final Color GRADIENT_TOP = const Color(0xfff5f5f5);
final Color GRADIENT_BOTTOM = const Color(0xffe8e8e8);

class EggTimerDial extends StatefulWidget {
  final Duration currentTime;
  final Duration maxTime;
  final int ticksPerSection;
  final Function(Duration) onTimeSelected;
  final Function(Duration) onDialStopTurning;

  const EggTimerDial({
    this.currentTime = const Duration(minutes: 0),
    this.maxTime = const Duration(minutes: 35),
    this.ticksPerSection = 5,
    this.onTimeSelected,
    this.onDialStopTurning,
  });
  @override
  _EggTimerDialState createState() => _EggTimerDialState();
}

class _EggTimerDialState extends State<EggTimerDial> {
  _rotationPercent() {
    return widget.currentTime.inSeconds / widget.maxTime.inSeconds;
  }

  @override
  Widget build(BuildContext context) {
    return DialTurnGestureDetector(
      maxTime: widget.maxTime,
      currentTime: widget.currentTime,
      onTimeSelected: widget.onTimeSelected,
      onDialStopTurning: widget.onDialStopTurning,
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(left: 45.0, right: 45.0),
          child: AspectRatio(
            aspectRatio: 1.0,
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [GRADIENT_TOP, GRADIENT_BOTTOM],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x44000000),
                      blurRadius: 2.0,
                      spreadRadius: 1.0,
                      offset: Offset(0, 1),
                    )
                  ]),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    padding: EdgeInsets.all(55.0),
                    child: CustomPaint(
                      painter: TickPainter(
                        tickCount: widget.maxTime.inMinutes,
                        ticksPerSec: widget.ticksPerSection,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(65.0),
                    child: EggTimerKnob(
                      rotationPercent: _rotationPercent(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DialTurnGestureDetector extends StatefulWidget {
  final currentTime;
  final maxTime;
  final child;
  final Function(Duration) onTimeSelected;
  final Function(Duration) onDialStopTurning;

  DialTurnGestureDetector({
    this.currentTime,
    this.maxTime,
    this.child,
    this.onTimeSelected,
    this.onDialStopTurning,
  });
  @override
  _DialTurnGestureDetectorState createState() =>
      _DialTurnGestureDetectorState();
}

class _DialTurnGestureDetectorState extends State<DialTurnGestureDetector> {
  PolarCoord startDragCoord;
  Duration startTimeDrag;
  Duration selectedTime;

  _onRadialDragStart(PolarCoord coord) {
    startDragCoord = coord;
    startTimeDrag = widget.currentTime;
  }

  _onRadialDragUpdate(PolarCoord coord) {
    if (startDragCoord != null) {
      var angleDiff = coord.angle - startDragCoord.angle;
      angleDiff = angleDiff >= 0.0 ? angleDiff : angleDiff + (2 * pi);
      final anglePercent = angleDiff / (2 * pi);
      final timeDiffInSeconds =
          (anglePercent * widget.maxTime.inSeconds).round();
      selectedTime =
          Duration(seconds: startTimeDrag.inSeconds + timeDiffInSeconds);
      print('${selectedTime.inMinutes}');
      widget.onTimeSelected(selectedTime);
    }
  }

  _onRadialDragEnd() {
    widget.onDialStopTurning(selectedTime);
    startDragCoord = null;
    startTimeDrag = null;
    selectedTime = null;
  }

  @override
  Widget build(BuildContext context) {
    return RadialDragGestureDetector(
      onRadialDragStart: _onRadialDragStart,
      onRadialDragUpdate: _onRadialDragUpdate,
      onRadialDragEnd: _onRadialDragEnd,
      child: widget.child,
    );
  }
}

class TickPainter extends CustomPainter {
  final LONG_TICK = 14.0;
  final SHORT_TICK = 4.0;

  final tickCount;
  final ticksPerSec;
  final tickInset;
  final tickPaint;
  final textPainter;
  final textStyle;

  TickPainter({
    this.tickCount = 35,
    this.ticksPerSec = 5,
    this.tickInset = 0,
  })  : tickPaint = Paint(),
        textPainter = TextPainter(
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
        ),
        textStyle = TextStyle(
          color: Colors.black,
          fontFamily: 'BebasNeue',
          fontSize: 20,
        ) {
    tickPaint.color = Colors.black;
    tickPaint.strokeWidth = 1.5;
  }
  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    canvas.save();
    for (var i = 0; i < tickCount; ++i) {
      final tickLength = i % ticksPerSec == 0 ? LONG_TICK : SHORT_TICK;
      canvas.drawLine(
        new Offset(0, -radius),
        new Offset(0, -radius - tickLength),
        tickPaint,
      );
      if (i % ticksPerSec == 0) {
        canvas.save();
        canvas.translate(0, -(size.width / 2) - 30.00);

        textPainter.text = TextSpan(
          text: '$i',
          style: textStyle,
        );
        textPainter.layout();

        final tickpercent = i / tickCount;
        var quadrant;
        if (tickpercent < 0.25) {
          quadrant = 1;
        } else if (tickpercent < 0.50) {
          quadrant = 4;
        } else if (tickpercent < 0.75) {
          quadrant = 3;
        } else {
          quadrant = 2;
        }
        switch (quadrant) {
          case 1:
            break;
          case 4:
            canvas.rotate(-pi / 2);
            break;
          case 3:
          case 2:
            canvas.rotate(pi / 2);
            break;
        }
        textPainter.paint(
          canvas,
          Offset(
            -textPainter.width / 2,
            -textPainter.height / 2,
          ),
        );

        canvas.restore();
      }
      canvas.rotate(2 * pi / tickCount);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
