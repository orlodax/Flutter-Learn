import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/models/todo_item.dart';

class ToDoDatabase {
  List<TodoItem> todoList = [];
  final Box _myBox = Hive.box('myBox');

  void _createInitialData() {
    todoList = [
      TodoItem(taskName: 'Make tutorial', isCompleted: false),
      TodoItem(taskName: 'Do Exercise', isCompleted: false),
    ];
  }

  void initializeData() {
    if (_myBox.get('TODOLIST') == null) {
      _createInitialData();
    } else {
      loadData();
    }
  }

  void loadData() {
    List<dynamic> data = _myBox.get('TODOLIST', defaultValue: []);
    todoList = data
        .map((item) => TodoItem.fromMap(Map<String, dynamic>.from(item)))
        .toList();
  }

  void updateDatabase() {
    List<Map<String, dynamic>> data = todoList
        .map((item) => item.toMap())
        .toList();
    _myBox.put('TODOLIST', data);
  }
}
