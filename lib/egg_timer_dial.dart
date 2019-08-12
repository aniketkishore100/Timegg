import 'package:flutter/material.dart';

final Color GRADIENT_TOP = const Color(0xfff5f5f5);
final Color GRADIENT_BOTTOM = const Color(0xffe8e8e8);
class EggTimerDial extends StatefulWidget {
  @override
  _EggTimerDialState createState() => _EggTimerDialState();
}

class _EggTimerDialState extends State<EggTimerDial> {
  @override
  Widget build(BuildContext context) {
    return Container(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
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
                          child: Padding(
                            padding: const EdgeInsets.all(65.0),
                            child: Container(
                              padding: EdgeInsets.all(10.0),
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
                            child: Container(
                              
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xffdfdfdf),
                                width: 1.5,
                              ),
                              ),
                          child: Center(
                            child: Image.network('https://avatars3.githubusercontent.com/u/14101776?s=400&v=4',
                            width: 50.0,
                            height: 50.0,
                            color: Colors.black,
                              )  ,
                          
                          ),
                            ),
                        ),
                          ),
                        ),
                  ),
                ),
                );
  }
}