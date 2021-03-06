import 'package:flutter/material.dart';
import 'package:getting_started/screens/bmi_screen.dart';
import 'package:getting_started/screens/intro_screen.dart';

void main() {
  runApp(const GlobeApp());
}

class GlobeApp extends StatelessWidget {
  const GlobeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: Center(child: Text('Hello world')),
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      routes: {
        '/': (context) => IntroScreen(),
        '/bmi': (context) => BMIScreen()
      },
      initialRoute: '/',
      //home: const IntroScreen()
      );
  }
}
