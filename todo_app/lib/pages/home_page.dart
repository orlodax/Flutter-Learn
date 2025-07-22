import 'package:flutter/material.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/util/dialog_box.dart';
import 'package:todo_app/util/todo_tile.dart';
import 'package:todo_app/models/todo_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    db.initializeData();

    super.initState();
  }

  void checkBoxChanged(int index, bool? value) {
    setState(() {
      TodoItem item = db.todoList[index];
      item.isCompleted = !item.isCompleted;
      db.updateDatabase();
    });
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogBox(
          controller: _controller,
          onSave: addTask,
          onCancel: cancelTask,
        );
      },
    );
  }

  void addTask() {
    setState(() {
      db.todoList.add(TodoItem(taskName: _controller.text, isCompleted: false));
      db.updateDatabase();
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void cancelTask() {
    _controller.clear();
    Navigator.of(context).pop();
  }

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
        title: Text(
          "TO DO",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: createNewTask,
        child: Icon(Icons.add, color: Colors.black),
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            todoItem: db.todoList[index],
            onChanged: (value) => {checkBoxChanged(index, value)},
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
