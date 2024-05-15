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
          'Are you sure you want to pre-register for this course?',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _buildNoButton(),
            SizedBox(
              width: 35,
            ),
            _buildYesButton(),
          ],
        )
      ],
    );
  }

  Widget _buildNoButton() {
    return FilledButton.icon(
      style: FilledButton.styleFrom(
        minimumSize: Size(100, 50),
        maximumSize: Size(300, 50),
        foregroundColor: Colors.black87,
        backgroundColor: Colors.white38,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Icon(Icons.close),
      label: const Text(
        'No',
        style: TextStyle(
            color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget _buildYesButton() {
    return FilledButton.icon(
      icon: Icon(Icons.check),
      style: FilledButton.styleFrom(
        minimumSize: Size(100, 50),
        maximumSize: Size(300, 50),
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
      label: const Text(
        'Yes',
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
      ),
      onPressed: () {
        _handleYesButton();
      },
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
        Navigator.of(context).pop();
        print(response.error!.message);
      } else {
        Navigator.of(context).pop();
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
