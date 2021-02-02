import 'package:flutter/material.dart';
import 'package:ejemplo1/screens/todo_list_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('es'), // Español    // ... otras regiones que la app soporte
      ],
      debugShowCheckedModeBanner: false,
      title: 'Todolist',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoListScreeen(),
    );
  }
}
