import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase{
  // reference the box
  final _myBox = Hive.openBox('myBox');

  // list of todo tasks
  List taskList = [
    ["First Task", false],
    ["Second Task", true]
  ];

}