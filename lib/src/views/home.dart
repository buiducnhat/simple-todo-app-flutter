import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/src/models/todo.dart';
import 'package:todo_app/src/widgets/todo_item_widget.dart';
import 'package:todo_app/src/__mocks__/todo_items_mock.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<TodoItem> _todoItems = todoItemsMock;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: ListView(
        children: _todoItems.isNotEmpty
            ? _todoItems.map((e) => TodoItemWidget(todoItem: e)).toList()
            : <Widget>[],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(CupertinoIcons.add),
      ),
    );
  }

  void _addTodoItem(TodoItem todoItem) {
    setState(() {
      this._todoItems.add(todoItem);
    });
  }
}
