import 'package:flutter/material.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/models/todo_item.dart';

class HomeViewModel extends ChangeNotifier {
  final ToDoDatabase _database = ToDoDatabase();
  final TextEditingController _taskController = TextEditingController();

  // Getters
  List<TodoItem> get todoList => _database.todoList;
  TextEditingController get taskController => _taskController;

  // Initialize the ViewModel
  void initialize() {
    _database.initializeData();
    notifyListeners();
  }

  // Add a new task
  void addTask(String taskName) {
    if (taskName.trim().isEmpty) return;

    _database.todoList.add(TodoItem(taskName: taskName, isCompleted: false));
    _database.updateDatabase();
    _taskController.clear();
    notifyListeners();
  }

  // Toggle task completion status
  void toggleTaskCompletion(int index) {
    if (index >= 0 && index < _database.todoList.length) {
      TodoItem item = _database.todoList[index];
      item.isCompleted = !item.isCompleted;
      _database.updateDatabase();
      notifyListeners();
    }
  }

  // Delete a task
  void deleteTask(int index) {
    if (index >= 0 && index < _database.todoList.length) {
      _database.todoList.removeAt(index);
      _database.updateDatabase();
      notifyListeners();
    }
  }

  // Clear the task input
  void clearTaskInput() {
    _taskController.clear();
  }

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }
}
