import 'package:ICTC_Website/models/student.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key, required this.student});

  final Student student;

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController firstNameCon,
      lastNameCon,
      conactCon,
      emailCon;

  @override
  void initState() {
    super.initState();

    print("student ${widget.student.id}");

    firstNameCon = TextEditingController(text: widget.student?.firstName);
    lastNameCon = TextEditingController(text: widget.student?.lastName);
    conactCon = TextEditingController(text: widget.student?.contactNumber);
    emailCon = TextEditingController(text: widget.student?.email);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: firstNameCon,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your first name';
              }
              return null;
            },
            onChanged: (_) => _formKey.currentState!.validate(),
            decoration: InputDecoration(
              labelText: 'First Name',
              labelStyle: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              hintText: 'Enter your first name',
              hintStyle: TextStyle(
                color: Colors.black38,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextFormField(
            controller: lastNameCon,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your last name';
              }
              return null;
            },
            onChanged: (_) => _formKey.currentState!.validate(),
            decoration: InputDecoration(
              labelText: 'Last Name',
              labelStyle: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              hintText: 'Enter your last name',
              hintStyle: TextStyle(
                color: Colors.black38,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextFormField(
            controller: emailCon,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter an email address";
              }

              if (!EmailValidator.validate(value)) {
                return "Enter a valid email address";
              }

              return null;
            },
            onChanged: (_) => _formKey.currentState!.validate(),
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              hintText: 'Enter your email',
              hintStyle: TextStyle(
                color: Colors.black38,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextFormField(
            controller: conactCon,
            inputFormatters: [
              LengthLimitingTextInputFormatter(11),
              FilteringTextInputFormatter.digitsOnly,
            ],
            onChanged: (_) => _formKey.currentState!.validate(),
            decoration: InputDecoration(
              labelText: 'Phone Number',
              labelStyle: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              hintText: 'Enter your phone number',
              hintStyle: TextStyle(
                color: Colors.black38,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 20),
          OutlinedButton(onPressed: saveProfile, child: Text('Save'))
        ],
      ),
    );
  }

  void saveProfile() async {
    final supabase = Supabase.instance.client;

    if (!_formKey.currentState!.validate()) {
      return;
    }

    final newStudent = Student(
      id: widget.student.id,
      firstName: firstNameCon.text,
      middleName: widget.student.middleName,
      lastName: lastNameCon.text,
      email: emailCon.text,
      contactNumber: conactCon.text,
      office: widget.student.office,
      designation: widget.student.designation,
      school: widget.student.school,
      yearLevel: widget.student.yearLevel,
      uuid: widget.student.uuid,
    );
    final uuid = supabase.auth.currentSession!.user.id;

    await supabase.from('student').update(newStudent.toJson()).eq('uuid', uuid);

    Navigator.of(context).pop();
  }
}
