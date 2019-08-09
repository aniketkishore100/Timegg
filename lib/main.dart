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
              Padding(
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
              ),
              RandomColorBlock(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(30.0),
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
              RandomColorBlock(
                width: double.infinity,
                height: 50.0,
              ),
            ]

          )
        ),
      )
    );
  }
}

