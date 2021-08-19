import 'package:flutter/material.dart';
import 'package:todo_app/src/theme/theme.dart';

import 'package:todo_app/src/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: myTheme,
      darkTheme: myDarkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
