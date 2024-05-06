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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Do you want to pre-register for this course?',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildNoButton(),
            _buildYesButton(),
          ],
        )
      ],
    );
  }

  Widget _buildNoButton() {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Text(
        'No',
        style: TextStyle(
          color: Colors.black45,
          fontSize: 18
        ),
      ),
    );
  }

  Widget _buildYesButton() {
    return TextButton(
      onPressed: () {
        _handleYesButton();
      },
      child: const Text(
        'Yes',
        style: TextStyle(
          color: Colors.blue,
          fontSize: 18
        ),
      ),
    );
  }

  void _handleYesButton() async {
    try {
      final registration = Register(
        studentId: widget.student.id,
        courseId: widget.course.id,
        is_approved: false,
      );

      final response = await Supabase.instance.client
          .from('registration')
          .insert(registration.toJson());
      if (response != null && response.error != null) {
        print(response.error!.message);
      } else {
        Navigator.of(context).pop();
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
