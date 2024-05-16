import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import './pages/home_page.dart';

void main(List<String> args) async {
  //init the hive
  await Hive.initFlutter();

  // open a box aka database's name
  await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
