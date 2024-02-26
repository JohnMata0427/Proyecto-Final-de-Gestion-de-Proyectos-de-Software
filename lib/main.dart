import 'package:flutter/material.dart';
import 'auth/login.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VehiCheck Express',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColorDark: Colors.black,
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
      home: const LoginScreen(),
    );
  }
}