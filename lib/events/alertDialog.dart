
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

buttonIos(
  BuildContext context, 
  String task, 
  String title,
  String botton, 
  Function onPre
) {
  return showDialog(
              context: context,
              builder: (BuildContext context) => CupertinoAlertDialog(
                  title: Text(title),
                  content: Text(task),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      isDefaultAction: true,
                      child: Text(botton),
                      onPressed: onPre,
                )
              ],
          )
  );
}
