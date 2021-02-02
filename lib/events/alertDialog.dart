import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@override
Widget buttonIos(BuildContext context, String task, String titleButton, String title,String botton, Function onPre) {
  return Scaffold(
    body: Center(
      child: RaisedButton(
        child: Text(titleButton),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) => CupertinoAlertDialog(
                  title: Text(title),
                  content: Text('Tu tarea: '+task),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      isDefaultAction: true,
                      child: Text(botton),
                      onPressed: onPre,
                )
              ],
            )
          );
        },
      ),
    ),
  );
}
