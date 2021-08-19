import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/src/models/task.dart';
import 'package:todo_app/src/widgets/dialog_add_task_widget.dart';
import 'package:todo_app/src/widgets/task_widget.dart';
import 'package:todo_app/src/__mocks__/tasks_mock.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Task> _todoItems = tasksMock;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: ListView(
        children: _todoItems.isNotEmpty
            ? _todoItems.map((e) => TaskWidget(task: e)).toList()
            : <Widget>[],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onPressedAddButton,
        child: Icon(CupertinoIcons.add),
      ),
    );
  }

  void _onPressedAddButton() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return DialogAddWidget(addTodoItem: _addTodoItem);
        });
  }

  void _addTodoItem(Task task) {
    setState(() {
      this._todoItems.add(task);
    });
  }
}
