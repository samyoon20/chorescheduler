import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'chores_history_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chores App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.green,
          secondary: Colors.lightGreen,
        ),
        scaffoldBackgroundColor: Colors.green[50],
      ),
      home: HomeScreen(),
      routes: {
        '/history': (context) => ChoresHistoryScreen(),
      },
    );
  }
}
