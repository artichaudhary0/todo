import 'package:hive/hive.dart';

class ToDoDatabase {
  List todoList = [];
  final box = Hive.box("mybox");

  // first time opening (install)
  void createInitialData() {
    todoList = [
      [
        "Create todo app",
        false,
      ],
      [
        "learn DSA",
        false,
      ],
    ];
  }

  // load data from database
  void loadData() {
    todoList = box.get("TODOLIST");
  }

  //update the database
  void updateDatabase() {
    box.put("TODOLIST", todoList);
  }
}
