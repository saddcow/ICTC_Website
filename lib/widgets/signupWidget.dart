import 'package:ICTC_Website/widgets/loginWidget.dart';
import 'package:ICTC_Website/widgets/signupFormWidget.dart';
import 'package:flutter/material.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({super.key});

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  bool _isLoginForm = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Center(
        child: SingleChildScrollView(
          child: Card(
            color: Colors.white,
            surfaceTintColor: Colors.white,
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: SizedBox(
                width: 350,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            width: 450,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 35, bottom: 30),
                                  child: Image(
                                      image: AssetImage(
                                          "assets/images/logo_ictc.png"),
                                      height: 100),
                                ),
                                Text(
                                  _isLoginForm ? "Login" : "Create an Account",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 24),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                buildForm(),
                                const SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  children: [
                                    const Row(
                                      children: [
                                        Expanded(child: Divider()),
                                        Text("     or     "),
                                        Expanded(child: Divider()),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    InkWell(
                                      customBorder: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      // hoverColor: const Color(0xff153faa).withOpacity(0.8),
                                      // highlightColor: const Color(0xff153faa).withOpacity(0.4),
                                      // splashColor: const Color(0xff153faa).withOpacity(1),
                                      onTap: () {
                                        setState(() {
                                          _isLoginForm = !_isLoginForm;
                                        });
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8),
                                        width: 350,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: const Color(0xff153faa),
                                            width: 1,
                                          ),
                                          // adding color will hide the splash effect
                                          color: Colors.transparent,
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.keyboard_backspace_rounded,
                                              color: Color(0xff153faa),
                                              size: 23,
                                            ),
                                            SizedBox(
                                              width: 9,
                                            ),
                                            Text(
                                              _isLoginForm
                                                  ? "Back to Sign Up"
                                                  : "Back to Login",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xff153faa)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildForm() {
    if (_isLoginForm) {
      return LoginWidget();
    } else {
      return SignupFormWidget();
    }
  }
}
