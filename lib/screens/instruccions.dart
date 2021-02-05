import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Instruccions extends StatefulWidget {

  @override
  _InstruccionsState createState() => _InstruccionsState();
}

class _InstruccionsState extends State<Instruccions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                 Text('Instrucciones de la App',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}
