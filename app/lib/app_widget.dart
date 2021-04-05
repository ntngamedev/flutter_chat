import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: asuka.builder,
      initialRoute: "/",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    ).modular();
  }
}
