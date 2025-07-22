import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/util/dialog_box.dart';
import 'package:todo_app/util/todo_tile.dart';
import 'package:todo_app/viewmodels/home_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = context.read<HomeViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _viewModel.initialize();
    });
  }

  void _showCreateTaskDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogBox(
          controller: _viewModel.taskController,
          onSave: _addTask,
          onCancel: _cancelTask,
        );
      },
    );
  }

  void _addTask() {
    _viewModel.addTask(_viewModel.taskController.text);
    Navigator.of(context).pop();
  }

  void _cancelTask() {
    _viewModel.clearTaskInput();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: Colors.yellow[200],
          appBar: AppBar(
            backgroundColor: Colors.amberAccent,
            centerTitle: true,
            title: Text(
              "TO DO",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            elevation: 0,
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.amber,
            onPressed: _showCreateTaskDialog,
            child: Icon(Icons.add, color: Colors.black),
          ),
          body: ListView.builder(
            itemCount: _viewModel.todoList.length,
            itemBuilder: (context, index) {
              return ToDoTile(
                todoItem: _viewModel.todoList[index],
                onChanged: (value) => _viewModel.toggleTaskCompletion(index),
                deleteFunction: (context) => _viewModel.deleteTask(index),
              );
            },
          ),
        );
      },
    );
  }
}
