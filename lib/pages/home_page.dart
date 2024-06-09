import 'package:flutter/material.dart';
import 'package:todo/data/database.dart';
import 'package:todo/util/dialog_box.dart';
import 'package:todo/util/todo_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference the box
  final _myBox = Hive.box('myBox');

  @override
  void initState() {
    // TODO: implement initState
    // first time opening this application
    // creating default database
    if(_myBox.get("TODOLIST") == null){
      db.createInitData();
    }else{
      db.loadData();
    }

    super.initState();
  }

  // Text controller
  final _controller = TextEditingController();
  
  // ToDo Database instance
  ToDoDatabase db = ToDoDatabase();

  // Save new Task
  void saveNewTask(){
    setState(() {
      db.taskList.add([_controller.text, false]);
      _controller.clear();
      Navigator.of(context).pop();
    });
    db.updateData();
  }

  // Create New Task
  void createNewTask() {
    showDialog(context: context, builder: (context) {
      return DialogBox(
        controller: _controller,
        onSave: saveNewTask,
        onCancel: Navigator.of(context).pop,
      );
    });
  }

  // check box taped
  void checkBoxChanged(bool value, int index) {
    setState(() {
      db.taskList[index][1] = !db.taskList[index][1];
    });
    db.updateData();
  }

  // delete existing Task
  void deleteTask(int index){
    setState(() {
      db.taskList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[50],
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text(
            "To Do",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              color: Colors.yellow,
            ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          backgroundColor: Colors.blueAccent,
          splashColor: Colors.blue,
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: db.taskList[index][0],
              taskCompleted: db.taskList[index][1],
              index: index,
              onChanged: (value) => checkBoxChanged(value!, index),
              deleteTask: (context) => deleteTask(index),
            );
          },
          itemCount: db.taskList.length,
        ));
  }
}
