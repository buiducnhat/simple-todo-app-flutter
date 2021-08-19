import 'package:flutter/material.dart';
import 'package:todo_app/src/models/task.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget(
      {Key? key, required this.task, required this.toggleCompleteTask})
      : super(key: key);
  final Task task;
  final Function toggleCompleteTask;

  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool _isExpand = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        ListTile(
            onTap: _toggleExpand,
            title: Text(
              widget.task.title,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    color: Colors.cyan,
                    onPressed: () {
                      print('a');
                    },
                    icon: Icon(Icons.edit_outlined)),
                // IconButton(
                //   color: Colors.red,
                //   onPressed: () {
                //     print('b');
                //   },
                //   icon: Icon(Icons.delete_outline_rounded),
                // )
                Checkbox(
                    value: widget.task.isCompleted,
                    onChanged: _onChangedToggleComplete)
              ],
            )),
        _isExpand
            ? Container(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Text(widget.task.content),
              )
            : Container()
      ]),
    );
  }

  void _toggleExpand() {
    setState(() {
      _isExpand = !_isExpand;
    });
  }

  void _onChangedToggleComplete(bool? value) {
    widget.toggleCompleteTask(widget.task.id);
  }
}
