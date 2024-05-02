import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfirmDialog extends StatefulWidget {
  const ConfirmDialog({super.key});

  @override
  State<ConfirmDialog> createState() => _ConfirmDialogState();
}

class _ConfirmDialogState extends State<ConfirmDialog> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: AlertDialog(
        title: Text('Confirm'),
        content: Text('Do you want to register to this course?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'No', 
              style: TextStyle(color: Colors.black45),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Yes',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}