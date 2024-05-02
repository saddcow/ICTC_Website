import 'package:ICTC_Website/models/course.dart';
import 'package:ICTC_Website/models/student.dart';
import 'package:ICTC_Website/pages/desktop/profile/editProfileForm.dart';
import 'package:ICTC_Website/widgets/regisConfirm.dart';
import 'package:ICTC_Website/widgets/signupWidget.dart';
import 'package:flutter/material.dart';
import 'package:ICTC_Website/pages/auth/login_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:ICTC_Website/main.dart';
import 'package:ICTC_Website/widgets/appBarDesktop.dart';
import 'package:ICTC_Website/widgets/preRegisterForm.dart';
import 'package:ICTC_Website/pages/desktop/footer.dart';

class PreRegisterPage extends StatefulWidget {
  const PreRegisterPage({super.key, required this.course});

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
    if (supabase.auth.currentUser != null) {
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
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40.0),
      child: SizedBox(
        width: 1690,
        height: 800,
        child: Card(
          elevation: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 840,
                height: 800,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                  ),
                  color: Color(0xFFF2F2F2),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 60.0, horizontal: 60.0),
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
                        '${widget.course.description}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        '${widget.course.schedule}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '${widget.course.duration}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: 30),
                      Text(
                        '₱ ${widget.course.cost}',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 30),
                      registerButton(context),
                    ],
                  ),
                ),
              ),
              Container(
                  width: 840,
                  height: 800,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                    child: Image.asset(
                      'assets/images/course1.png',
                      fit: BoxFit.fill,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget registerButton(context) {
    return FilledButton(
      onPressed: () {
        if (_isLoggedIn) {
          showDialog(
              context: context,
              builder: (context) {
                return registerDialog(context);
              });
        } else {
          showDialog(
              context: context,
              builder: (context) {
                return signupDialog(context);
              });
        }
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

    return AlertDialog(
      contentPadding: const EdgeInsets.only(left: 20, right: 30, top: 40),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: FractionalOffset.topRight,
            child: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          const Text(
            'Pre-Register',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          )
        ],
      ),
      content: Flexible(
        flex: 2,
        child: Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height * 0.5,
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                          return ProfileForm(student: student);
                        }

                        return ConfirmDialog();
                      }

                      return Text('Error');
                    })
              ],
            ))),
      ),
    );
  }

  Widget signupDialog(context) {
    return AlertDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: FractionalOffset.topRight,
            child: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          const Text(
            'Sign Up',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          )
        ],
      ),
      content: SignupWidget(),
    );
  }
}
