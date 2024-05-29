import 'package:flutter/material.dart';
import 'package:flutter_survey/flutter_survey.dart';

class EvaluationPage extends StatefulWidget {
  const EvaluationPage({super.key, required this.courseId});

  final int courseId;

  @override
  State<EvaluationPage> createState() => _EvaluationPageState();
}

class _EvaluationPageState extends State<EvaluationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Survey(initialData: [
          Question(question: "are u a gamer"),
          Question(question: "are u a gamer"),
          Question(question: "are u a gamer"),
          Question(question: "are u a gamer"),
          Question(question: "are u a gamer"),
          Question(question: "are u a gamer")
        ]));
  }
}
