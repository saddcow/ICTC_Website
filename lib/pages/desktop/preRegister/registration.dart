import 'package:ICTC_Website/pages/auth/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(50, 90, 0, 90),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              //   width: MediaQuery.of(context).size.width * 0.5,
              //   height: 100,
              //   decoration: BoxDecoration(color: Colors.grey),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildCartBody(),
                  buildCheckout(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCartBody() {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * .8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.83,
              child: Text(
                "Shopping Cart",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 34,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "1 Course in Cart",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                  Divider(
                    height: 1,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Column(
                //add items here
                children: [
                  buildItem(),
                ],
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  Widget buildCheckout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * .8,
          child: Container(
            margin: EdgeInsets.only(top: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total:",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black45,
                      fontSize: 14),
                ),
                Text(
                  "P3,290",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                      fontSize: 35),
                ),
                Material(
                  color: Color(0xff153faa),
                  child: InkWell(
                    splashColor: Colors.orange,
                    onTap: () async {
                      await showDialog<void>(
                          context: context,
                          builder: (context) => buildSignUpDialog());
                    },
                    child: Container(
                      color: Colors.transparent,
                      height: 50,
                      width: 500,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            size: 23,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            "Checkout",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  height: 1,
                  endIndent: 76,
                ),
                buildPromotion(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildItem() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 80,
      decoration: BoxDecoration(color: Colors.transparent),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // IMAGE
            margin: EdgeInsets.only(right: 10),
            width: MediaQuery.of(context).size.width * 0.1,
            height: 80,
            decoration: BoxDecoration(color: Colors.black12),
          ),
          Column(
            // DETAILS
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hacking Course",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                "By Abdul Salsalini",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
              ),
              Text(
                "9.5 total hours - 51 lectures",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.20,
          ),
          Row(
            // ACTIONS
            children: [
              CupertinoButton(
                onPressed: () {},
                child: Text(
                  "Remove",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                    fontSize: 14,
                    fontFamily: "Montserrat",
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.03,
              ),
              Text(
                "P3,290",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color(0xff153faa),
                    fontSize: 15),
              ),
            ],
          ),

          // Column(
          //   // PRICE TAG
          //   crossAxisAlignment: CrossAxisAlignment.end,
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     Text(
          //       "P3290",
          //       style: TextStyle(
          //           fontWeight: FontWeight.w600, color: Colors.black87),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }

  Widget buildPromotion() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 15, right: 75),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Promotions",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                child: TextFormField(
                  style: TextStyle(
                      height: 0,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                    suffixIcon: OutlinedButton(
                      style: ButtonStyle(
                        shape: MaterialStatePropertyAll(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0)),
                          ),
                        ),
                        backgroundColor:
                            MaterialStatePropertyAll(Color(0xff153faa)),
                        iconColor: MaterialStatePropertyAll(Colors.white),
                        foregroundColor: MaterialStatePropertyAll(Colors.white),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Apply",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                    ),
                    labelText: "Voucher Code",
                    labelStyle: TextStyle(color: Colors.black54, fontSize: 12),
                    floatingLabelStyle: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Form buildLoginForm() {
    return Form(
        // key: formKey,
        child: Column(
      children: [
        TextFormField(
          // controller: emailCon,
          // validator: (value) {
          //   if (value == null || value.isEmpty) {
          //     return "Enter an email address";
          //   }

          //   if (!EmailValidator.validate(value)) {
          //     return "Enter a valid email address";
          //   }

          //   return null;
          // },
          // onChanged: (_) => formKey.currentState!.validate(),
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
          // // controller: passwordCon,
          // validator: (value) {
          //   if (value == null || value.isEmpty) {
          //     return "Enter a password";
          //   }

          //   if (value.length < 6) {
          //     return "Password must be at least 6 characters";
          //   }

          //   return null;
          // },
          // onChanged: (_) => formKey.currentState!.validate(),
          // onFieldSubmitted: (_) => login(),
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
          // onTap: login,
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
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ),
        ),
      ],
    ));
  }

  Widget buildLoginDialog() {
    return AlertDialog(
      content: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.3,
                height: MediaQuery.sizeOf(context).height * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 35, bottom: 30),
                      child: Image(
                          image: AssetImage("assets/images/logo_ictc.png"),
                          height: 100),
                    ),
                    const Text(
                      "Log in to Ateneo ICTC",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        child: buildLoginForm()),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSignUpDialog() {
    return AlertDialog(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      content: Container(
        height: MediaQuery.of(context).size.height*0.8,
        color: Colors.transparent,
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              color: Colors.white,
              surfaceTintColor: Colors.white,
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: SizedBox(
                  width: 400,
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
                                  const Text(
                                    "Create an Account",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 24),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  buildSignUpForm(),
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
                                            borderRadius:
                                                BorderRadius.circular(35),
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
                                                "Login to your account",
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
      ),
    );
  }

  Form buildSignUpForm() {
    return Form(
        // key: formKey,
        child: Column(
      children: [
        TextFormField(
          // controller: firstNameCon,
          // validator: (value) {
          //   if (value == null || value.isEmpty) {
          //     return "Enter a first name";
          //   }

          //   return null;
          // },
          // onChanged: (_) => formKey.currentState!.validate(),
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
          // controller: lastNameCon,
          // validator: (value) {
          //   if (value == null || value.isEmpty) {
          //     return "Enter a last name";
          //   }

          //   return null;
          // },
          // onChanged: (_) => formKey.currentState!.validate(),
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
          // controller: emailCon,
          // validator: (value) {
          //   if (value == null || value.isEmpty) {
          //     return "Enter an email address";
          //   }

          //   if (!EmailValidator.validate(value)) {
          //     return "Enter a valid email address";
          //   }

          //   return null;
          // },
          // onChanged: (_) => formKey.currentState!.validate(),
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
          // controller: passwordCon,
          // validator: (value) {
          //   if (value == null || value.isEmpty) {
          //     return "Enter a password";
          //   }

          //   if (value.length < 6) {
          //     return "Password must be at least 6 characters";
          //   }

          //   return null;
          // },
          // onChanged: (_) => formKey.currentState!.validate(),
          // keyboardType: TextInputType.visiblePassword,
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
          // controller: confirmCon,
          // validator: (value) {
          //   if (value != passwordCon.text) {
          //     return "Passwords do not match";
          //   }

          //   return null;
          // },
          // onChanged: (value) => formKey.currentState!.validate(),
          // keyboardType: TextInputType.visiblePassword,
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
          // onTap: register,
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
