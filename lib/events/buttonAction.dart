import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:ejemplo1/models/colors.dart';

SpeedDialChild getSpeedBuild (BuildContext _, Icon icons, Color buttonColors,
        Color fonts, String textLabel, Widget task)
    {
      return SpeedDialChild(
          child: icons,
          backgroundColor: buttonColors,
          onTap: () {
            Navigator.push(
              _,
              CupertinoPageRoute(builder: (_) => task),
            );
          },
          label: textLabel,
          labelStyle: TextStyle(
              fontWeight: FontWeight.w500, color: fonts, fontSize: 16.0),
          labelBackgroundColor: buttonColors);
    }

Widget getButtonsFloating(BuildContext _, Widget addTaks, Widget instruccions) {
  return SpeedDial(
    animatedIcon: AnimatedIcons.menu_close,
    animatedIconTheme: IconThemeData(size: 22),
    backgroundColor: Theme.of(_).primaryColor,
    visible: true,
    curve: Curves.bounceIn,
    children: [
      getSpeedBuild(_ ,Icon(Icons.add_outlined),buttonColor,bodyColor,'Añadir Tarea',addTaks),
      getSpeedBuild(_ ,Icon(Icons.assignment_turned_in),buttonColor,bodyColor,'Instruciones',instruccions),
    ],
  );
}
