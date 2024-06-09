import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase{
  // reference the box
  final _myBox = Hive.box('myBox');

  // list of todo tasks
  List taskList = [];

  // create initial data for first time
  void createInitData(){
    taskList = [
      ["First Task", false],
      ["Second Task", true],
      ["Third Task", false],

    ];
  }

  // load DataBase
  void loadData(){
    taskList = _myBox.get("TODOLIST");
  }

  // update Database
  void updateData(){
    _myBox.put("TODOLIST", taskList);
  }
}