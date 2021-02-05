import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:ejemplo1/models/colors.dart';


Widget getButtonsFloating(BuildContext _, Widget addTaks, Widget instruccions) {
  return SpeedDial(
    animatedIcon: AnimatedIcons.menu_close,
    animatedIconTheme: IconThemeData(size: 22),
    backgroundColor: Theme.of(_).primaryColor,
    visible: true,
    curve: Curves.bounceIn,
    children: [
      SpeedDialChild(
          child: Icon(Icons.add_outlined),
          backgroundColor: buttonColor,
          onTap: () {
            Navigator.push(
              _,
              CupertinoPageRoute(builder: (_) => addTaks),
            );
          },
          label: 'Añadir tarea',
          labelStyle: TextStyle(
              fontWeight: FontWeight.w500, color: Colors.white, fontSize: 16.0),
          labelBackgroundColor: buttonColor
      ),
      SpeedDialChild(
          child: Icon(Icons.assignment_turned_in),
          backgroundColor: buttonColor,
          onTap: () {
            Navigator.push(
              _,
              CupertinoPageRoute(builder: (_) => instruccions),
            );
          },
          label: 'Instruciones',
          labelStyle: TextStyle(
              fontWeight: FontWeight.w500, color: Colors.white, fontSize: 16.0),
          labelBackgroundColor: buttonColor
      )
    ],
  );
}
