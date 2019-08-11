import 'package:egg_timer/egg_timer_display.dart';
import 'package:egg_timer/flat_button_timer.dart';
import 'package:flutter/material.dart';
import 'package:fluttery/animations.dart';
import 'package:fluttery/framing.dart';
import 'package:fluttery/gestures.dart';
import 'package:fluttery/layout.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Egg Timer',
      theme: ThemeData(
        fontFamily: 'BebasNeue'
      ),
      home:Scaffold(
        body: Center(
          child: Column(
            children: [
              EggTimerTimeDisplay(),
              
              RandomColorBlock(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(left:30.0,right: 30.0),
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: RandomColorBlock(
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
              Expanded(child: Container()),
              RandomColorBlock(
                width: double.infinity,
                height: 50.0,
              ),
              EggTimerButton(),
            ]
          ),
        ),
      )
    );
  }
}

