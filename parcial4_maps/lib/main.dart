import 'package:flutter/material.dart';
import 'package:parcial4_maps/ui/pages/home/home_page.dart';
import 'package:parcial4_maps/ui/utils/my_painter.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parcial 4 ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
