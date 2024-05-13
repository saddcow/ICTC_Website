import 'package:ICTC_Website/models/register.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:ICTC_Website/models/course.dart';
import 'package:ICTC_Website/models/student.dart';
import 'package:ICTC_Website/pages/desktop/profile/editProfileForm.dart';
import 'package:ICTC_Website/widgets/dialogWidget.dart';
import 'package:ICTC_Website/widgets/regisConfirm.dart';
import 'package:ICTC_Website/widgets/appBarDesktop.dart';
import 'package:ICTC_Website/pages/desktop/footer.dart';
import 'package:html_unescape/html_unescape.dart';

class PreRegisterPage extends StatefulWidget {
  const PreRegisterPage({Key? key, required this.course}) : super(key: key);

  final Course course;

  @override
  State<PreRegisterPage> createState() => _PreRegisterPageState();
}

class _PreRegisterPageState extends State<PreRegisterPage> {
  bool _isLoggedIn = false;

  @override
  void initState() {
    checkLoggedIn();
    super.initState();
  }

  void checkLoggedIn() {
    // Check if the user is logged in
    final supabase = Supabase.instance.client;
    if (supabase.auth.currentSession?.user != null) {
      setState(() {
        _isLoggedIn = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDesktop(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildBox(context),
            FooterWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildBox(context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              width: 840,
              height: 800,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
                //color: Color(0xFFF2F2F2),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 40.0, horizontal: 60.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.course.title}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '${HtmlUnescape().convert(widget.course.description ?? "No description provided.")}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          "Venue: ",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          '${widget.course.venue}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          "Schedule: ",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          '${widget.course.schedule}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "Duration: ",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          '${widget.course.duration}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      '₱ ${widget.course.cost}',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 25),
                    registerButton(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget registerButton(context) {
    return FilledButton(
      onPressed: () async {
        if (_isLoggedIn) {
          final result = await showDialog(
            barrierLabel: 'Register',
              barrierDismissible: true,
              context: context,
              builder: (context) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    registerDialog(context),
                  ],
                );
              });
          print(result);

          // try {
          final registration = Register(
            studentId: await Supabase.instance.client
                .from('student')
                .select()
                .eq('uuid',
                    Supabase.instance.client.auth.currentSession?.user.id ?? "")
                .single()
                .withConverter((students) => Student.fromJson(students).id),
            courseId: widget.course.id,
            is_approved: false,
          );

          final response = await Supabase.instance.client
              .from('registration')
              .insert(registration.toJson());
          if (response != null && response.error != null) {
            Navigator.of(context).pop();
            print(response.error!.message);
            // } else {
            // Navigator.of(context).pop();
            // }
            // } catch (e) {
            //   print('Error: $e');
          }

          // if (result != null && result) {
          //   final supabase = Supabase.instance.client;
          //   final uuid = Supabase.instance.client.auth.currentSession?.user.id;
          //   final register =  Register(
          //     studentId: await supabase
          //       .from('student')
          //           .select()
          //           .eq('uuid', uuid ?? "")
          //           .withConverter((students) => Student.fromJson(students as Map<String, dynamic>) as int?),
          //     courseId: widget.course.id,
          //     is_approved: false,
          //   );
          // }
        } else {
          await showDialog(
            barrierLabel: 'Pre-Register',
              barrierDismissible: true,
              context: context,
              builder: (context) {
                return FormDialog();
              });
        }

        checkLoggedIn();
      },
      child: Text(
        'Pre-Register',
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget registerDialog(context) {
    final uuid = Supabase.instance.client.auth.currentSession?.user.id;

    return Container(
      // width: MediaQuery.of(context).size.width * 0.3,
      // height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          FutureBuilder(
            future: Supabase.instance.client
                .from('student')
                .select()
                .eq('uuid', uuid ?? "")
                .single()
                .withConverter((data) => Student.fromJson(data)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
      
              if (snapshot.hasData) {
                final student = snapshot.data!;
      
                if (student.school == null && student.office == null) {
                  return AlertDialog(
                    content: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                          ProfileForm(student: student),
                        ],
                      ),)
                    ));
                }
      
                return AlertDialog(
                  titlePadding: EdgeInsets.fromLTRB(0, 32, 0, 0),
                  title: Center(child: Text('Confirm Registration', 
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)
                  
                  ,)),
                  actionsPadding: EdgeInsets.only(bottom: 0),
                  contentPadding: EdgeInsets.only(top:0, right:40, left: 40, bottom: 0),
                    content: Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ConfirmDialog(
                          course: widget.course, student: student),
                    ],
                  ),
                ));
              }
      
              return Text('Error');
            },
          ),
        ],
      ),
    );
  }
}
