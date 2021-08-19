import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/src/models/task.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget(
      {Key? key,
      required this.task,
      required this.toggleCompleteTask,
      required this.removeTask})
      : super(key: key);
  final Task task;
  final Function toggleCompleteTask;
  final Function removeTask;

  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool _isExpand = false;

  @override
  Widget build(BuildContext context) {
    final normalTitleStyle = TextStyle(
        color: widget.task.isCompleted
            ? Theme.of(context).highlightColor
            : Theme.of(context).primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 18,
        decoration:
            widget.task.isCompleted ? TextDecoration.lineThrough : null);

    return Dismissible(
        key: Key(widget.task.id.toString()),
        direction: DismissDirection.endToStart,
        onDismissed: (DismissDirection? direction) {
          print('helo');
          widget.removeTask(widget.task.id);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Task ${widget.task.title} was removed!")));
        },
        confirmDismiss: (DismissDirection? direction) =>
            _onSwipeTask(direction),
        background: Container(
          color: Colors.red,
          padding: EdgeInsets.symmetric(horizontal: 16),
          alignment: AlignmentDirectional.centerEnd,
          child: Icon(Icons.delete, color: Colors.white),
        ),
        child: Card(
          child: Column(children: [
            ListTile(
                onTap: _toggleExpand,
                title: Text(
                  widget.task.title,
                  style: normalTitleStyle,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        color: Theme.of(context).accentColor,
                        onPressed: () {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text('Edit!!')));
                        },
                        icon: Icon(Icons.edit_outlined)),
                    Checkbox(
                        fillColor: MaterialStateProperty.resolveWith(
                            (states) => Theme.of(context).primaryColor),
                        value: widget.task.isCompleted,
                        onChanged: _onChangedToggleComplete)
                  ],
                )),
            _isExpand
                ? Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    child: Column(children: [
                      Divider(),
                      Text(
                        widget.task.content,
                        style: TextStyle(color: Colors.grey),
                      )
                    ]),
                  )
                : Container()
          ]),
          elevation: 3,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        ));
  }

  void _toggleExpand() {
    setState(() {
      _isExpand = !_isExpand;
    });
  }

  void _onChangedToggleComplete(bool? value) {
    widget.toggleCompleteTask(widget.task.id);
  }

  Future<bool> _onSwipeTask(DismissDirection? direction) async {
    return await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Are you sure to remove this task?'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: Text('Cancel')),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: Text('Ok'))
                ],
              );
            }) ??
        false;
  }
}
