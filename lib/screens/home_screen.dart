import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/database/database.dart';
import 'package:todo_app/utlis/dialog_widget.dart';
import 'package:todo_app/utlis/todo_list_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final box = Hive.box("mybox");
  ToDoDatabase db = ToDoDatabase();
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDatabase();
  }

  final controller = TextEditingController();

  void createAddTask() {
    showDialog(
      context: (context),
      builder: (context) {
        return DialogWidget(
          controller: controller,
          onSave: saveTask,
          onCancelled: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void saveTask() {
    setState(
      () {
        if (controller.text.isEmpty) {
          // Navigator.of(context).pop();
        } else {
          db.todoList.add([controller.text, false]);
          controller.clear();
        }
      },
    );
    db.updateDatabase();
    Navigator.of(context).pop();
  }

  void deleteTask(int index) {
    setState(
      () {
        db.todoList.removeAt(index);
      },
    );
    db.updateDatabase();
  }

  @override
  void initState() {
    if (box.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text(
          "TODO",
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
          ),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (BuildContext context, int index) {
          return ToDoTile(
            taskName: db.todoList[index][0],
            isTaskCompleted: db.todoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) {
              deleteTask(index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: createAddTask,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
