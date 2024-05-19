import 'dart:async';
import 'package:intl/intl.dart';
import 'package:ICTC_Website/models/course.dart';
import 'package:ICTC_Website/models/register.dart';
import 'package:ICTC_Website/models/student.dart';
import 'package:ICTC_Website/pages/desktop/home.dart';
import 'package:ICTC_Website/pages/desktop/profile/course_dialog.dart';
import 'package:ICTC_Website/pages/desktop/profile/profileDetails.dart';
import 'package:ICTC_Website/widgets/appBarDesktop.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final _stream = Supabase.instance.client
      .from('student')
      .stream(primaryKey: ['id'])
      .eq('uuid', Supabase.instance.client.auth.currentSession?.user.id ?? "")
      .limit(1)
      .map((event) => Student.fromJson(event.first));

  late StreamSubscription authStream;

  @override
  void initState() {
    authStream =
        Supabase.instance.client.auth.onAuthStateChange.listen((event) {
      print('noticed change');

      if (event.event == AuthChangeEvent.signedOut) {
        print('signed out, put back to home');
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDesktopPage(),
            ));
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    authStream.cancel();
    super.dispose();
  }

  Future<List<Course>> getPendingCourses(Student student) async {
    final query = await Supabase.instance.client
        .from('course')
        .select('*, registration!inner(*)')
        .eq('registration.student_id', student.id)
        .eq('registration.is_approved', false)
        .withConverter(
          (data) => data
              .map(
                (e) => Course.fromJson(e),
              )
              .toList(),
        );

    return query;
  }

  Future<List<Course>> getOngoingCourses(Student student) async {
    final query = await Supabase.instance.client
        .from('course')
        .select('*, registration!inner(*)')
        .eq('registration.student_id', student.id)
        .eq('registration.is_approved', true)
        .withConverter(
          (data) => data
              .map(
                (e) => Course.fromJson(e),
              )
              .toList(),
        );

    return query;
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
    return StreamBuilder(
      stream: _stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasData) {
          return buildProfileWidgets(context, snapshot.data!);
        }

        return Center(child: Text('Are you not logged in?'));
      },
    );
  }

  Widget buildProfileWidgets(BuildContext context, Student student) {
    return Container(
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
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ongoingCard(context, student),
                pendingCard(context, student),
                
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget pendingCard(BuildContext context, Student student) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pending Courses',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.5,
          margin: EdgeInsets.only(top: 10, bottom: 0),
          child: FutureBuilder(
            future: getPendingCourses(student),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              final courseList = snapshot.data!;

              if (courseList.isEmpty) {
                return Center(
                  child: Text("No registered courses!"),
                );
              }

              return ListView.builder(
                shrinkWrap: true,
                itemCount: courseList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return createPendingText(courseList[index], student);
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget createPendingText(Course course, Student student) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.15,
          margin: EdgeInsets.only(top: 10, bottom: 0, left: 5),
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white24,
            border: Border.all(color: Colors.black38, width: 0.5),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: InkWell(
            onTap: () async {
              await showDialog<void>(
                barrierLabel: 'Pending Course Details',
                barrierDismissible: true,
                context: context,
                builder: (context) {
                  return buildPendingDialog(course);
                }
                  //context: context, builder: (context) => buildPendingDialog(course)
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        course.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        " ${DateFormat.yMMMMd().format(course.startDate!)} - ${DateFormat.yMMMMd().format(course.endDate!)} "
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPendingDialog(Course course) {
    return AlertDialog(
      content: Container(
        // width: MediaQuery.of(context).size.width * 0.3,
        // height: MediaQuery.of(context).size.height * 0.3,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    "Title: ${course.title}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text( 
                    "Schedule: ${DateFormat.yMMMMd().format(course.startDate!)} - ${DateFormat.yMMMMd().format(course.endDate!)}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  //SizedBox(height: 20),
                  // Text(
                  //   "Payment Status: Paid",
                  //   style: TextStyle(
                  //     fontSize: 18,
                  //     fontWeight: FontWeight.w400,
                  //   ),
                  // ),
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

  Widget ongoingCard(BuildContext context, Student student) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ongoing Courses',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.5,
          margin: EdgeInsets.only(top: 10, bottom: 0),
          child: FutureBuilder(
            future: getOngoingCourses(student),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              final courseList = snapshot.data!;

              if (courseList.isEmpty) {
                return Center(
                  child: Text("No ongoing courses!"),
                );
              }

              return ListView.builder(
                shrinkWrap: true,
                itemCount: courseList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return createOngoingText(courseList[index], student);
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget createOngoingText(Course course, Student student) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.15,
          margin: EdgeInsets.only(top: 10, bottom: 0, left: 5),
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white24,
            border: Border.all(color: Colors.black38, width: 0.5),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: InkWell(
            onTap: () async {
              await showDialog<void>(
                barrierLabel: 'Ongoing Course Details',
                barrierDismissible: true,
                context: context,
                builder: (context) {
                  return buildOngoingDialog(course);
                }
                //context: context, builder: (context) => buildOngoingDialog(course)
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        course.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                         " ${DateFormat.yMMMMd().format(course.startDate!)} - ${DateFormat.yMMMMd().format(course.endDate!)} "
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildOngoingDialog(Course course) {
    return AlertDialog(
      content: Container(
        // width: MediaQuery.of(context).size.width * 0.3,
        // height: MediaQuery.of(context).size.height * 0.3,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    "Ongoing Course Details",
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
                    "Title: ${course.title}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Schedule: ${DateFormat.yMMMMd().format(course.startDate!)} - ${DateFormat.yMMMMd().format(course.endDate!)}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  //SizedBox(height: 20),
                  // Text(
                  //   "Payment Status: Paid",
                  //   style: TextStyle(
                  //     fontSize: 18,
                  //     fontWeight: FontWeight.w400,
                  //   ),
                  // ),
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
