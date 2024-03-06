import 'package:flutter/material.dart';
import 'package:vehicheck_express/layouts/inicio.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String title = 'VehiCheck Express';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFFFF0000),
        primaryColorDark: const Color.fromRGBO(4, 4, 4, 1),
        primaryColorLight: Colors.white,
        primarySwatch: Colors.red,
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return Colors.red;
            }
            return Colors.white;
          }),
        ),
      ),
      home: const Home(),
    );
  }
}