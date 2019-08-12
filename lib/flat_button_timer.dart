import 'package:flutter/material.dart';

class EggTimerButton extends StatelessWidget {
  final IconData icon;
  final String text;

  const EggTimerButton({
    this.icon,
    this.text,
  });

  
  @override
  Widget build(BuildContext context) {
    return FlatButton(
                splashColor: Color(0x22000000),
                onPressed: (){ },
                child: Padding(padding: EdgeInsets.all(25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.only(right: 3.0),
                    child: Icon(
                      icon,
                      color: Colors.black,
                    ),
                    
                    ),
                    Text(text,
                    style: TextStyle(color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    ),
                    ),
                    
                  ],
                ),
                ),
              );
  }
}