import 'package:flutter/material.dart';
import 'package:ICTC_Website/pages/auth/login_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:ICTC_Website/main.dart';
import 'package:ICTC_Website/widgets/appBarDesktop.dart';
import 'package:ICTC_Website/widgets/preRegisterForm.dart';
import 'package:ICTC_Website/pages/desktop/footer.dart';

class PreRegisterPage extends StatefulWidget {
  const PreRegisterPage({Key? key}) : super(key: key);

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
                        'Certified Artificial Intelligence Professional',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        'January 6 - 7, 2024',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Online Training',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: 30),
                      Text(
                        '₱ 5600',
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
        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget registerDialog(context) {
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
        child: SizedBox(
            width: 550,
            height: MediaQuery.of(context).size.height * 0.4,
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [preRegisterForm()],
            ))),
      ),
    );
  }

  Widget signupDialog(context) {
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
            'Sign Up',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          )
        ],
      ),
      content: SizedBox(
        width: 550,
        height: MediaQuery.of(context).size.height * 0.4,
        child: SingleChildScrollView(
          child: SignupPage(),
        ),
      ),
    );
  }
}

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late final TextEditingController emailCon,
      passwordCon,
      confirmCon,
      firstNameCon,
      lastNameCon;
  final formKey = GlobalKey<FormState>();

  register() async {
    final supabase = Supabase.instance.client;

    if (!formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please correct any invalid input.")));
      return;
    }

    await supabase.auth.signUp(
      email: emailCon.text,
      password: passwordCon.text,
      data: {"user_type": "STUDENT"},
    ).then((value) async {
      final uuid = value.session!.user.id;

      await supabase.from('student').insert({
        'first_name': firstNameCon.text,
        'last_name': lastNameCon.text,
        'email': emailCon.text,
        'uuid': uuid,
      });
    }).whenComplete(() {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Successfully signed up!")));

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainApp(),
          ));
    });
  }

  @override
  void initState() {
    emailCon = TextEditingController();
    passwordCon = TextEditingController();
    confirmCon = TextEditingController();
    firstNameCon = TextEditingController();
    lastNameCon = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: firstNameCon,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter a first name";
                }

                return null;
              },
              onChanged: (_) => formKey.currentState!.validate(),
              keyboardType: TextInputType.name,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.black54,
                  size: 20,
                ),
                labelText: "First Name",
                labelStyle: TextStyle(color: Colors.black54, fontSize: 12),
                floatingLabelStyle: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: lastNameCon,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter a last name";
                }

                return null;
              },
              onChanged: (_) => formKey.currentState!.validate(),
              keyboardType: TextInputType.name,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.black54,
                  size: 20,
                ),
                labelText: "Last Name",
                labelStyle: TextStyle(color: Colors.black54, fontSize: 12),
                floatingLabelStyle: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 12),
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
              onChanged: (_) => formKey.currentState!.validate(),
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.email_rounded,
                  color: Colors.black54,
                  size: 20,
                ),
                labelText: "E-mail",
                labelStyle: TextStyle(color: Colors.black54, fontSize: 12),
                floatingLabelStyle: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: passwordCon,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter a password";
                }

                if (value.length < 6) {
                  return "Password must be at least 6 characters";
                }

                return null;
              },
              onChanged: (_) => formKey.currentState!.validate(),
              keyboardType: TextInputType.visiblePassword,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
              obscureText: true,
              obscuringCharacter: '•',
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.key_rounded,
                  color: Colors.black54,
                  size: 20,
                ),
                labelText: "Password",
                labelStyle: TextStyle(color: Colors.black54, fontSize: 12),
                floatingLabelStyle: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: confirmCon,
              validator: (value) {
                if (value != passwordCon.text) {
                  return "Passwords do not match";
                }

                return null;
              },
              onChanged: (value) => formKey.currentState!.validate(),
              keyboardType: TextInputType.visiblePassword,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
              // onFieldSubmitted: (_) => state.register(),
              obscureText: true,
              obscuringCharacter: '•',
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.password_rounded,
                  color: Colors.black54,
                  size: 20,
                ),
                labelText: "Confirm Password",
                labelStyle: TextStyle(color: Colors.black54, fontSize: 12),
                floatingLabelStyle: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 24),
            InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              // hoverColor: const Color(0xff153faa).withOpacity(0.8),
              // highlightColor: const Color(0xff153faa).withOpacity(0.4),
              // splashColor: const Color(0xff153faa).withOpacity(1),
              onTap: register,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 8),
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  // adding color will hide the splash effect
                  color: const Color(0xff153faa),
                ),
                child: const Text(
                  "Register",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ));
  }
}
