import 'package:ICTC_Website/models/student.dart';
import 'package:ICTC_Website/pages/desktop/attendedDetails.dart';
import 'package:ICTC_Website/pages/desktop/pendingDetails.dart';
import 'package:ICTC_Website/pages/desktop/profileDetails.dart';
import 'package:ICTC_Website/pages/desktop/profiles.dart';
import 'package:ICTC_Website/widgets/appBarDesktop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final Future<Student> loggedInStudent;

  @override
  void initState() {
    final uuid = Supabase.instance.client.auth.currentSession!.user.id;
    loggedInStudent = Supabase.instance.client
        .from('student')
        .select()
        .eq('uuid', uuid)
        .limit(1)
        .withConverter((data) => Student.fromJson(data.first));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarDesktop(),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildStudentDetails(),
            ],
          ),
        ));
  }

  Widget buildStudentDetails() {
    return FutureBuilder(
      future: loggedInStudent,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return buildProfileWidgets(context, snapshot.data as Student);
        }

        return Text('An error occurred');
      },
    );
  }

  Widget buildProfileWidgets(BuildContext context, Student student) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 90),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileDetails(student: student),
                ],
              ),
              SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [attendedCard(context), pendingCard(context)],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget attendedCard(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Attended Programs/Courses',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              )),
          attendedContent(),
        ],
      ),
    );
  }

  Widget pendingCard(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pending Programs/Courses',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: pendingContent(),
            ),
          ),
        ],
      ),
    );
  }

  Widget pendingContent() {
    List<String> pendingItems = [
      'A Bootcamp on HTML, CSS, and PHP',
      'Guide on Full Stack Development',
      'Learning MERN',
    ];

    return ListView.builder(
      shrinkWrap: true,
      itemCount: pendingItems.length,
      itemBuilder: (context, index) {
        return Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              margin: EdgeInsets.only(top: 10, bottom: 0),
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white24,
                border: Border.all(color: Colors.black38, width: 0.5),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: InkWell(
                onTap: () async {
                  await showDialog<void>(
                      context: context,
                      builder: (context) => buildAttendedDialog());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      pendingItems[index],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget attendedContent() {
    List<String> attendedItems = [
      'Hacker Course',
      'Introduction to Artificial Intelligence',
      'Complete Course on UI/UX Design',
    ];

    return ListView.builder(
      shrinkWrap: true,
      itemCount: attendedItems.length,
      itemBuilder: (context, index) {
        return Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              margin: EdgeInsets.only(top: 10, bottom: 0),
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white24,
                border: Border.all(color: Colors.black38, width: 0.5),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: InkWell(
                onTap: () async {
                  await showDialog<void>(
                      context: context,
                      builder: (context) => buildAttendedDialog());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      attendedItems[index],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget buildAttendedDialog() {
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
                        "Attended Course Details",
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                ),
                Divider(),
                SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Course Name: Advance Figma",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Course Date: January 12 - 13, 2024",
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
                        "Certificate Status: Received",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )));
  }

  Widget buildPendingDialog() {
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
                    "Course Name: Introduction to Cyber Security",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Course Date: April 19 - 20, 2021",
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
    );
  }
  
}
