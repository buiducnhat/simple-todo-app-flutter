import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogAddWidget extends StatefulWidget {
  const DialogAddWidget({Key? key, required this.addTodoItem})
      : super(key: key);

  final Function addTodoItem;

  @override
  _DialogAddWidgetState createState() => _DialogAddWidgetState();
}

class _DialogAddWidgetState extends State<DialogAddWidget> {
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
              ),
              TextFormField(
                minLines: 1,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Content',
                ),
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
        ElevatedButton(
          onPressed: () {},
          child: Text('Add'),
        )
      ],
    );
  }
}
