import 'package:flutter/material.dart';
import 'package:todo/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  // init Hive
  await Hive.initFlutter();

  // open a box
  var box = await Hive.openBox('myBox');

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
