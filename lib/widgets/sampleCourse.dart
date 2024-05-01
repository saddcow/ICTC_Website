import 'package:ICTC_Website/pages/desktop/preregister.dart';
import 'package:ICTC_Website/pages/desktop/registration.dart';
import 'package:flutter/material.dart';

class SampleCourseCard extends StatefulWidget {
  const SampleCourseCard({super.key});

  @override
  State<SampleCourseCard> createState() => _SampleCourseCardState();
}

class _SampleCourseCardState extends State<SampleCourseCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 500,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Micro-Credential",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline)),
                  Text("₱ 5600")
                ],
              ),
              SizedBox(height: 20),
              Text("Certified Artificial Intelligence Professional",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
              SizedBox(height: 20),
              Text("Lorem ipsum dolor sit amet chuchu chuchuness"),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FilledButton(
                      onPressed: () {
                        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PreRegisterPage()));
                      },
                      child: Text(
                        "Pre-Register",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ))
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: AspectRatio(
                  aspectRatio: 20 / 10,
                  child: Image.asset(
                    'assets/images/course1.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
