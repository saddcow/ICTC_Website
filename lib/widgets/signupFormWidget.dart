import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignupFormWidget extends StatefulWidget {
  const SignupFormWidget({super.key});

  @override
  State<SignupFormWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupFormWidget> {
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

      Navigator.pop(context);
      
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
