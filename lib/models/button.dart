import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

cicleButton(
  BuildContext context,
  BuildContext _,
  Function builderRoot,
) {
  return Scaffold(
      floatingActionButton: FloatingActionButton(
    backgroundColor: Theme.of(_).primaryColor,
    onPressed: () {
      Navigator.push(
        context,
        CupertinoPageRoute(builder: (_) => (builderRoot())),
      );
    },
    child: Icon(Icons.add),
  ));
}
