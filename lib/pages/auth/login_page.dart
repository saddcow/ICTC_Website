import 'package:ICTC_Website/pages/auth/signup_page.dart';
import 'package:ICTC_Website/pages/desktop/home.dart';
import 'package:ICTC_Website/pages/desktop/footer.dart';
import 'package:ICTC_Website/widgets/appBarDesktop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String assetName = 'assets/images/svg_logo.svg';
    Widget getSVGImage(String assetName) {
      final Widget companyLogo =
          SvgPicture.asset(assetName, semanticsLabel: 'Ateneo ICTC Logo');
      return companyLogo;
    }

    return Scaffold(
      appBar:  AppBarDesktop(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: 90),
          buildBody(context),
          FooterWidget(),
        ],
      )),
    );
  }
}

Widget buildBody(context) {
  return Container(
    color: Colors.transparent,
    child: Center(
      child: SingleChildScrollView(
        child: Card(
          color: Colors.white,
          elevation: 2,
          surfaceTintColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SizedBox(
              width: 350,
              height: 670,
              child: Row(
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
                          height: 670,
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
                              const Text(
                                "Log in to Ateneo ICTC",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 24),
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                          "Don't have a school account?"),
                                      MaterialButton(
                                          minWidth: 30,
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const SignupPage(),
                                                ));
                                          },
                                          hoverColor: Colors.transparent,
                                          child: const Text(
                                            "Register",
                                            style: TextStyle(
                                                color: Color(0xff153faa),
                                                fontWeight: FontWeight.w500,
                                                decoration:
                                                    TextDecoration.underline),
                                          )),
                                    ],
                                  ),
                                ],
                              )
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

Form buildForm() {
  return Form(
      // key: (state.formKey),
      child: Column(
    children: [
      TextFormField(
        // controller: state.emailCon,
        // validator: Validators.isAnEmail,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(
            Icons.email_rounded,
            color: Colors.black54,
            size: 20,
          ),
          labelText: "Email",
          labelStyle: TextStyle(color: Colors.black54, fontSize: 12),
          floatingLabelStyle: TextStyle(
            color: Colors.black54,
            fontSize: 16,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        ),
      ),
      const SizedBox(height: 12),
      TextFormField(
        // controller: state.passwordCon,
        // onFieldSubmitted: (_) => state.login(),
        // validator: Validators.hasValue,
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        obscuringCharacter: '•',
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(
            Icons.key,
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
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MaterialButton(
              minWidth: 30,
              onPressed: null,
              hoverColor: Colors.transparent,
              child: const Text(
                "Forgot your password?",
                style: TextStyle(
                    color: Color(0xff153faa),
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline),
              )),
        ],
      ),
      const SizedBox(height: 12),
      InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        // hoverColor: const Color(0xff153faa).withOpacity(0.8),
        // highlightColor: const Color(0xff153faa).withOpacity(0.4),
        // splashColor: const Color(0xff153faa).withOpacity(1),
        onTap: null,
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
            "Log in",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
      ),
    ],
  ));
}
