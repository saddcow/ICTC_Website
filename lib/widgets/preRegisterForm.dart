import 'package:ICTC_Website/models/student.dart';
import 'package:ICTC_Website/pages/desktop/editProfileForm.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class preRegisterForm extends StatefulWidget {
  const preRegisterForm({super.key, required this.student});

  final Student student;

  @override
  State<preRegisterForm> createState() => _preRegisterFormState();
}

class _preRegisterFormState extends State<preRegisterForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController firstNameCon,
      lastNameCon,
      conactCon,
      emailCon,
      schoolCon,
      courseCon,
      yearLevelCon,
      officeCon,
      designationCon;
  late final ProfileType? _type;

  @override
  void initState() {
    super.initState();

    firstNameCon = TextEditingController(text: widget.student.firstName);
    lastNameCon = TextEditingController(text: widget.student.lastName);
    conactCon = TextEditingController(text: widget.student.contactNumber);
    emailCon = TextEditingController(text: widget.student.email);
    schoolCon = TextEditingController(text: widget.student.school);
    courseCon = TextEditingController(text: widget.student.course);
    yearLevelCon =
        TextEditingController(text: widget.student.yearLevel.toString());
    officeCon = TextEditingController(text: widget.student.office);
    designationCon = TextEditingController(text: widget.student.designation);

    if (widget.student.school != null) {
      _type = ProfileType.student;
    } else if (widget.student.office != null) {
      _type = ProfileType.professional;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        //First Name
        Row(
          children: [
            Flexible(
              child: CupertinoTextFormFieldRow(
                prefix: const Row(
                  children: [
                    Text("First Name",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w400)),
                    SizedBox(width: 12),
                  ],
                ),
                controller: firstNameCon,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
                // padding: EdgeInsets.only(left: 90),
                placeholder: "e.g. John",
                placeholderStyle: const TextStyle(
                  fontSize: 14, //
                  fontWeight: FontWeight.w400,
                  color: Colors.black45,
                ),
                onChanged: (_) => _formKey.currentState!.validate(),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
                decoration: BoxDecoration(
                  // border: ,
                  border: Border.all(
                    color: Colors.black87,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(18),
                  // prefixIcon: Icon(Icons.person)
                ),
              ),
            ),

            // LAST NAME
            Flexible(
              child: CupertinoTextFormFieldRow(
                prefix: const Row(
                  children: [
                    Text("Last Name",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w400)),
                    SizedBox(width: 12),
                  ],
                ),
                // padding: EdgeInsets.only(left: 90),
                placeholder: "e.g. De La Cruz",
                placeholderStyle: const TextStyle(
                  fontSize: 14, //
                  fontWeight: FontWeight.w400,
                  color: Colors.black45,
                ),
                controller: lastNameCon,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
                onChanged: (_) => _formKey.currentState!.validate(),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
                decoration: BoxDecoration(
                  // border: ,
                  border: Border.all(
                    color: Colors.black87,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(18),
                  // prefixIcon: Icon(Icons.person)
                ),
              ),
            ),
          ],
        ),
        //EMAIL ADDRESS
        CupertinoTextFormFieldRow(
          prefix: const Row(
            children: [
              Text("Email Address",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.w400)),
              SizedBox(width: 24),
            ],
          ),
          placeholder: "e.g. jdoe@gmail.com",
          placeholderStyle: const TextStyle(
            fontSize: 14,
            color: Colors.black45,
            fontWeight: FontWeight.w400,
          ),
          controller: emailCon,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your email';
            }

            if (!EmailValidator.validate(value)) {
              return "Enter a valid email address";
            }
          },
          onChanged: (_) => _formKey.currentState!.validate(),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
          decoration: BoxDecoration(
            // border: ,
            border: Border.all(
              color: Colors.black87,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(18),
            // prefixIcon: Icon(Icons.person)
          ),
        ),

        // CONTACT NUMBER
        CupertinoTextFormFieldRow(
          prefix: const Row(
            children: [
              Text("Contact Number",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.w400)),
              SizedBox(width: 12),
            ],
          ),
          // padding: EdgeInsets.only(left: 90),
          placeholder: "e.g. 09123456789",
          placeholderStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black45,
          ),
          controller: conactCon,
          inputFormatters: [
            LengthLimitingTextInputFormatter(11),
            FilteringTextInputFormatter.digitsOnly,
          ],
          onChanged: (_) => _formKey.currentState!.validate(),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
          decoration: BoxDecoration(
            // border: ,
            border: Border.all(
              color: Colors.black87,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(18),
            // prefixIcon: Icon(Icons.person)
          ),
        ),

        SizedBox(height: 30),
        submitButton()
      ],
    ));
  }

  studentExt() {
    return Column(
      children: [
        // SCHOOL
        CupertinoTextFormFieldRow(
          prefix: const Row(
            children: [
              Text("School",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.w400)),
              SizedBox(width: 12),
            ],
          ),
          controller: schoolCon,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter name of school';
            }
            return null;
          },
          onChanged: (_) => _formKey.currentState!.validate(),
          placeholder: "e.g. Ateneo de Naga University",
          placeholderStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black45,
          ),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black87,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
        ),

        // Course
        CupertinoTextFormFieldRow(
          prefix: const Row(
            children: [
              Text("Course",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.w400)),
              SizedBox(width: 12),
            ],
          ),
          controller: courseCon,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter course';
            }
            return null;
          },
          onChanged: (_) => _formKey.currentState!.validate(),
          placeholder: "e.g. BS Information Technology",
          placeholderStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black45,
          ),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black87,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
        ),

        // Year Level
        CupertinoTextFormFieldRow(
          prefix: const Row(
            children: [
              Text("Year Level",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.w400)),
              SizedBox(width: 12),
            ],
          ),
          controller: yearLevelCon,
          inputFormatters: [
            LengthLimitingTextInputFormatter(11),
            FilteringTextInputFormatter.digitsOnly,
          ],
          onChanged: (_) => _formKey.currentState!.validate(),
          placeholder: "e.g. 1",
          placeholderStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black45,
          ),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black87,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ],
    );
  }

  professionalExt() {
    return Column(
      children: [
        // OFFICE
        CupertinoTextFormFieldRow(
          prefix: const Row(
            children: [
              Text("Office",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.w400)),
              SizedBox(width: 12),
            ],
          ),
          controller: officeCon,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter name of office';
            }
            return null;
          },
          onChanged: (_) => _formKey.currentState!.validate(),
          placeholder: "e.g. ICTC",
          placeholderStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black45,
          ),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black87,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
        ),

        // DESIGNATION
        CupertinoTextFormFieldRow(
          prefix: const Row(
            children: [
              Text("Designation",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.w400)),
              SizedBox(width: 12),
            ],
          ),
          controller: designationCon,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter designation';
            }
            return null;
          },
          onChanged: (_) => _formKey.currentState!.validate(),
          placeholder: "e.g. Software Developer",
          placeholderStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black45,
          ),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black87,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ],
    );
  }

  buildExtension() {
    if (_type == ProfileType.student) {
      return studentExt();
    } else if (_type == ProfileType.professional) {
      return professionalExt();
    } else {
      return Container();
    }
  }
}

Widget submitButton() {
  return OutlinedButton(
    child: Text("Submit"),
    onPressed: () {},
  );
}
