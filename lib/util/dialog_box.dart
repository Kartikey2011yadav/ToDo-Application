import 'package:flutter/material.dart';
import 'package:todo/util/button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  const DialogBox ({
    super.key,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 400,
        width: 290,
        padding: const EdgeInsets.only(top: 10),
        child:  Column(
          children: [
             TextField(
              controller: controller,
              cursorColor: Colors.blue,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
                labelText: "Task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton(text: "Save", onPressed: () {}),
                MyButton(text: "Cancel", onPressed: () {}),

              ],
            )
          ],
        ),
      ),
    );
  }
}

