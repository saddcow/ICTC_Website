import 'package:ICTC_Website/pages/auth/login_page.dart';
import 'package:ICTC_Website/pages/desktop/footer.dart';
import 'package:ICTC_Website/pages/desktop/home.dart';
import 'package:ICTC_Website/widgets/appBarDesktop.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDesktop(),
      body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 120),
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
          surfaceTintColor: Colors.white,
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SizedBox(
              width: 350,
              height: 730,
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
                          height: 730,
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
                                "Create an Account",
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
                                  InkWell(
                                    customBorder: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    // hoverColor: const Color(0xff153faa).withOpacity(0.8),
                                    // highlightColor: const Color(0xff153faa).withOpacity(0.4),
                                    // splashColor: const Color(0xff153faa).withOpacity(1),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginPage(),
                                          ));
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      width: 350,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(35),
                                        border: Border.all(
                                          color: const Color(0xff153faa),
                                          width: 1,
                                        ),
                                        // adding color will hide the splash effect
                                        color: Colors.transparent,
                                      ),
                                      child: const Row(
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
                                            "Back to Login",
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

Form buildForm() {
  return Form(
      // key: state.formKey,
      child: Column(
    children: [
      TextFormField(
        // controller: state.schoolNameCon,
        // validator: Validators.hasValue,
        keyboardType: TextInputType.name,
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
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
        // controller: state.officeNameCon,
        // validator: Validators.hasValue,
        keyboardType: TextInputType.name,
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
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
        // controller: state.passwordCon,
        // validator: Validators.hasValue,
        keyboardType: TextInputType.visiblePassword,
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
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
        // controller: state.confirmCon,
        // validator: state.confirmPassword,
        keyboardType: TextInputType.visiblePassword,
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
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
        // onTap: state.register,
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
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
      ),
    ],
  ));
}
