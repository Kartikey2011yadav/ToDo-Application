import 'package:flutter/material.dart';
import 'package:todo/util/dialog_box.dart';
import 'package:todo/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // Text controller
  final _controller = TextEditingController();

  // list of todo tasks
  List taskList = [
    ["First Task", false],
    ["Second Task", true]
  ];

  // Create New Task
  void createNewTask() {
    showDialog(context: context, builder: (context) {
      return DialogBox(
        controller: _controller,
        onSave: () {  },
        onCancel: Navigator.of(context).pop,
      );
    });
  }

  // check box taped
  void checkBoxChanged(bool value, int index) {
    setState(() {
      taskList[index][1] = !taskList[index][1];
    });
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
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: taskList[index][0],
              taskCompleted: taskList[index][1],
              onChanged: (value) => checkBoxChanged(value!, index),
            );
          },
          itemCount: taskList.length,
        ));
  }
}
