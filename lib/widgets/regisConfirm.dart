import 'package:ICTC_Website/models/course.dart';
import 'package:ICTC_Website/models/register.dart';
import 'package:ICTC_Website/models/student.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ConfirmDialog extends StatefulWidget {
  const ConfirmDialog({Key? key, required this.course, required this.student})
      : super(key: key);

  final Course course;
  final Student student;

  @override
  State<ConfirmDialog> createState() => _ConfirmDialogState();
}

class _ConfirmDialogState extends State<ConfirmDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Confirm'),
      content: Text('Do you want to register for this course?'),
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
          onPressed: () async {
            final registration = Register(
              studentId: widget.student.id,
              courseId: widget.course.id,
              is_approved: false // Set default value to false
            );

            final response = await Supabase.instance.client
                .from('registration')
                .insert(registration.toJson());

            if (response.error != null) {
              // Handle error
              print(response.error!.message);
            } else {
              // Registration successful
              Navigator.pop(context); // Close the dialog
            }
          },
          child: Text(
            'Yes',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
