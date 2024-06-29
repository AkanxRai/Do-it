import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do/data/database.dart';
import 'package:to_do/Do%20It/util/dialogbox.dart';

import 'package:to_do/Do%20It/util/todo_title.dart';

class ToDo_HomePage extends StatefulWidget {
  const ToDo_HomePage({super.key});

  @override
  State<ToDo_HomePage> createState() => _ToDo_HomePageState();
}

class _ToDo_HomePageState extends State<ToDo_HomePage> {
  final _mybox = Hive.box('myBox');
  final _controller = TextEditingController();
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    if (_mybox.get("ToDoList") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void CheckBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
      db.updateDataBase();
    });
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.of(context).pop();
    });
    db.updateDataBase();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
              controller: _controller,
              onSave: saveNewTask,
              onCancel: () => Navigator.of(context).pop());
        });
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        toolbarHeight: 70,
        centerTitle: true,
        title: const Text(
          "TO DO",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (BuildContext context, int index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => CheckBoxChanged(value, index),
            deletefunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
