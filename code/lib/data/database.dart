import 'package:hive/hive.dart';

class ToDoDataBase {
  List toDoList = [];
  final _mybox = Hive.box('myBox');
  void createInitialData() {
    toDoList = [
      ['Your First Task', false],
      ['Your Second Task', false],
    ];
  }

  void loadData() {
    toDoList = _mybox.get("ToDoList");
  }

  void updateDataBase() {
    _mybox.put("ToDoList", toDoList);
  }
}
