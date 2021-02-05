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
                 Text(
                   'Instrucciones de la App',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 30,
                ),
                Text(
                  '📎 En caso de que el cliente requiera crear un tarea, deberá elegir el '
                  'botón en la esquina inferior derecha 🔵 , una vez allí ponga el nombre'
                  ' de la tarea, la fecha límite en la que se propone realizar el tarea y'
                  ' por último la prioridad del tarea.',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '📎 En el caso de que necesites eliminarlo o actualizarlo, simplemente '
                  'selecciónalo, donde podrás cambiar el nombre, la fecha y la prioridad '
                  'de dicha tarea.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                  )
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}
