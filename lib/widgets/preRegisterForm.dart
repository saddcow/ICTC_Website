import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class preRegisterForm extends StatefulWidget {
  const preRegisterForm({super.key});

  @override
  State<preRegisterForm> createState() => _preRegisterFormState();
}

class _preRegisterFormState extends State<preRegisterForm> {
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
                // padding: EdgeInsets.only(left: 90),
                placeholder: "e.g. John",
                placeholderStyle: const TextStyle(
                  fontSize: 14, //
                  fontWeight: FontWeight.w400,
                  color: Colors.black45,
                ),
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
          // padding: EdgeInsets.only(left: 90),
          placeholder: "e.g. jdoe@gmail.com",
          placeholderStyle: const TextStyle(
            fontSize: 14,
            color: Colors.black45,
            fontWeight: FontWeight.w400,
          ),
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
          // padding: EdgeInsets.only(left: 90),
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
            // border: ,
            border: Border.all(
              color: Colors.black87,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(18),
            // prefixIcon: Icon(Icons.person)
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
          // padding: EdgeInsets.only(left: 90),
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
            // border: ,
            border: Border.all(
              color: Colors.black87,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(18),
            // prefixIcon: Icon(Icons.person)
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
          // padding: EdgeInsets.only(left: 90),
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
}

Widget submitButton(){
  return OutlinedButton(
    child: Text("Submit"),
    onPressed: (){},
  );
}