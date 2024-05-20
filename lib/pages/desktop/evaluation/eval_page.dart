import 'package:flutter/material.dart';
import 'package:flutter_survey/flutter_survey.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EvaluationPage extends StatefulWidget {
  const EvaluationPage(
      {super.key, required this.courseId, required this.studentId});

  final int courseId, studentId;

  @override
  State<EvaluationPage> createState() => _EvaluationPageState();
}

class _EvaluationPageState extends State<EvaluationPage> {
  final _formKey = GlobalKey<FormState>();

  List<QuestionResult> _questionResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: FutureBuilder(
            future: Supabase.instance.client
                .from('questionnaire')
                .select()
                .eq('id', -1)
                .limit(1)
                .single(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (!snapshot.hasData) {
                return const Center(
                  child: Icon(Icons.error),
                );
              }

              print(snapshot.data);

              return Survey(
                initialData: [
                  for (Map<String, dynamic> json
                      in snapshot.data!['questionnaire']['questions'])
                    Question.fromJson(json)
                ],
                onNext: (questionResults) => _questionResults = questionResults,
              );
            }),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              child: Container(
                  padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
                  child: ElevatedButton(
                      onPressed: submitForm, child: Text("Submit"))))
        ],
      ),
    );
  }

  Future<void> submitForm() async {
    if (!_formKey.currentState!.validate()) return;
    if (_questionResults.length == 0) return;

    // TODO: insert response into database
    final query =
        Supabase.instance.client.from('questionnaire_responses').insert({
      "student_id": widget.studentId,
      "course_id": widget.courseId,
      "response": {
        for (QuestionResult r in _questionResults) r.question: r.answers
      }
    }).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Your response is successfully sent!")));
      Navigator.pop(context);
    }).onError(
      (err, st) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("An error occured! ${err.toString()}")));
      },
    );
  }
}
