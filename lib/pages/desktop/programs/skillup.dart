import 'package:ICTC_Website/widgets/appBarDesktop.dart';
import 'package:flutter/material.dart';
import 'package:ICTC_Website/pages/desktop/home.dart';

class SkillUpPage extends StatefulWidget {
  const SkillUpPage({super.key});

  @override
  State<SkillUpPage> createState() => _SkillUpPageState();
}

class _SkillUpPageState extends State<SkillUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDesktop(),

    );
  }
}