import 'dart:async';
import 'package:ICTC_Website/models/course.dart';
import 'package:ICTC_Website/models/register.dart';
import 'package:ICTC_Website/models/student.dart';
import 'package:ICTC_Website/pages/desktop/home.dart';
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
    final response = await Supabase.instance.client
        .from('registration')
        .select()
        .eq('student_id', student.id)
        .eq('is_approved', false)
        .withConverter(
            (data) => data.map((e) => Register.fromJson(e)).toList());
    if (response.isEmpty) {
      return List.empty();
    }

    final List<Course> courses = [];

    for (Register r in response) {
      final course = await Supabase.instance.client
          .from('course')
          .select()
          .eq('id', r.courseId!)
          .limit(1)
          .single()
          .withConverter((data) => Course.fromJson(data));

      courses.add(course);
    }

    return courses;
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
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              pendingCard(context, student),
            ],
          ),
        ],
      ),
    );
  }

  Widget pendingCard(BuildContext context, Student student) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.height * 0.2,
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
                    return createPendingText(courseList[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget createPendingText(Course course) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.1,
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
                  context: context, builder: (context) => buildPendingDialog());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    course.title!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
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
