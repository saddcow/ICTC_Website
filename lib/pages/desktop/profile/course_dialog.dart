import 'package:ICTC_Website/models/course.dart';
import 'package:ICTC_Website/models/student.dart';
import 'package:ICTC_Website/pages/desktop/evaluation/eval_page.dart';
import 'package:ICTC_Website/pages/desktop/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileCourseDialog extends StatefulWidget {
  const ProfileCourseDialog(
      {super.key, required this.course, required this.student});

  final Course course;
  final Student student;

  @override
  State<ProfileCourseDialog> createState() => _ProfileCourseDialogState();
}

class _ProfileCourseDialogState extends State<ProfileCourseDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.height * 0.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                  Text(
                    "Pending Course Details",
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
            ),
            Divider(),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${widget.course.title}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "${widget.course.schedule}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Payment Status: Paid",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Certificate Status: Pending",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      actions: [
        FutureBuilder(
          future: hasAttended(),
          builder: (context, snapshot) => ElevatedButton(
            onPressed:
                snapshot.data == null || !snapshot.data! ? null : toEvaluation,
            child: Text("Take Evaluation"),
          ),
        ),
      ],
    );
  }

  Future<bool> hasAttended() async {
    final query = await Supabase.instance.client
        .from('registration')
        .select('attended')
        .eq('course_id', widget.course.id!)
        .eq('student_id', widget.student.id)
        .limit(1)
        .single()
        .withConverter((data) => data.values.first as bool);

    return query;
  }

  void toEvaluation() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EvaluationPage(
            courseId: widget.course.id!,
            studentId: widget.student.id,
          ),
        ));
  }
}
