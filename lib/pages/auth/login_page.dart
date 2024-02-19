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
      appBar: AppBarDesktop(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Ads
              Column(
                children: [
                  buildAds(context),
                ],
              ),
              // Signin
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildBody(context),
                ],
              ),
            ],
          ),
          FooterWidget(),
        ],
      )),
    );
  }
}

Widget buildAds(context) {
  return Padding(
    padding: const EdgeInsets.all(30.0),
    child: SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.4,
      // height: MediaQuery.sizeOf(context).height * 0.8,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.4,
                  height: MediaQuery.sizeOf(context).height * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/ads1.jpg',
                        fit: BoxFit.cover,
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
  );
}

Widget buildBody(context) {
  return Padding(
    padding: const EdgeInsets.all(30.0),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.4,
              height: MediaQuery.sizeOf(context).height * 0.8,
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
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      child: buildForm(context)),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Form buildForm(context) {
  return Form(
      // key: (state.formKey),
      child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      TextFormField(
        // controller: state.emailCon,
        // validator: Validators.isAnEmail,
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(
            Icons.email_rounded,
            color: Colors.black54,
            size: 20,
          ),
          labelText: "Email",
          labelStyle: TextStyle(
              color: Colors.black54, fontSize: 12, fontWeight: FontWeight.w400),
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
        style: const TextStyle(
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
          labelStyle: TextStyle(
              color: Colors.black54, fontSize: 12, fontWeight: FontWeight.w400),
          floatingLabelStyle: TextStyle(
            color: Colors.black54,
            fontSize: 16,
          ),
        ),
      ),
      const SizedBox(height: 12),
      InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        // hoverColor: const Color(0xff153faa).withOpacity(0.8),
        // highlightColor: const Color(0xff153faa).withOpacity(0.4),
        // splashColor: const Color(0xff153faa).withOpacity(1),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const HomeDesktopPage(),
            ),
          );
        },
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 8),
          width: MediaQuery.sizeOf(context).width * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            // adding color will hide the splash effect
            color: const Color(0xff153faa),
          ),
          child: const Text(
            "Log in",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
      ),
    ],
  ));
}
