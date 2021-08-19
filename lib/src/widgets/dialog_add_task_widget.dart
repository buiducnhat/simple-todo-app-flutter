import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/src/models/task.dart';

class DialogAddWidget extends StatefulWidget {
  const DialogAddWidget(
      {Key? key, required this.lastTaskId, required this.addTask})
      : super(key: key);

  final int lastTaskId;
  final Function addTask;

  @override
  _DialogAddWidgetState createState() => _DialogAddWidgetState();
}

class _DialogAddWidgetState extends State<DialogAddWidget> {
  String _title = '';
  String _content = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text('Add new task'),
      content: Container(
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                onChanged: (value) {
                  setState(() {
                    this._title = value;
                  });
                },
              ),
              TextFormField(
                minLines: 1,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Content',
                ),
                onChanged: (value) {
                  setState(() {
                    this._content = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        ElevatedButton(child: Text('Add'), onPressed: _onPressAddButton)
      ],
    );
  }

  void _onPressAddButton() {
    widget.addTask(
        new Task(widget.lastTaskId + 1, this._title, this._content, false));
    Navigator.pop(context);
  }
}
