import 'package:ICTC_Website/pages/auth/login_page.dart';
import 'package:ICTC_Website/pages/auth/signup_page.dart';
import 'package:ICTC_Website/pages/programs/google_certified_educators.dart';
import 'package:ICTC_Website/pages/programs/microcredentials.dart';
import 'package:ICTC_Website/pages/programs/skillup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeDesktopPage extends StatefulWidget {
  const HomeDesktopPage({super.key});

  @override
  State<HomeDesktopPage> createState() => _HomeDesktopPageState();
}

class _HomeDesktopPageState extends State<HomeDesktopPage> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
    );

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0.5,
        title: Padding(
          padding: const EdgeInsets.only(left: 155.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Image.asset('assets/images/logo_ictc.png',
                    width: 60, height: 70),
              ),
              Text("Ateneo ICTC",
                  style: TextStyle(fontSize: 20, color: Color(0xff153faa)))
              // Your widgets here
            ],
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 155.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  style: style,
                  onPressed: () {},
                  child: const Text('About Us'),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    PopupMenuButton<String>(
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      padding: EdgeInsets.all(0),
                      surfaceTintColor: Colors.white,
                      elevation: 4,
                      offset: Offset.fromDirection(90, 10),
                      position: PopupMenuPosition.under,
                      icon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Row(
                          children: [
                            Text(
                              "Programs",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff153faa)),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Icon(
                              CupertinoIcons.chevron_down,
                              size: 9,
                              color: Color(0xff153faa),
                            ),
                          ],
                        ),
                      ),
                      tooltip: "View more programs",
                      itemBuilder: (BuildContext context) {
                        return [
                          PopupMenuItem(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const MicrocredentialsPage(),
                                ),
                              );
                            },
                            child: const Text(
                              "Micro-credential Program",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 14),
                            ),
                          ),
                          PopupMenuItem(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const GoogleCertifiedEducatorsPage(),
                                ),
                              );
                            },
                            child: const Text(
                              "Google Certified Educator Program",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 14),
                            ),
                          ),
                          PopupMenuItem(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const SkillUpPage(),
                                ),
                              );
                            },
                            child: const Text(
                              "Skillup Program",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 14),
                            ),
                          ),
                        ];
                      },
                    ),
                  ],
                ),
                SizedBox(width: 20),
                buildButtons()
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Expanded(
          flex: 1,
          child: Column(
            children: [
              _hero(context),
              _programs(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButtons() {
    final ButtonStyle filledStyle = FilledButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onSecondary,
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
    );
    final ButtonStyle outlinedStyle = OutlinedButton.styleFrom(
      surfaceTintColor: Colors.white,
      elevation: 0,
      side: BorderSide(width: 1, color: Color(0xff153faa)),
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
    );

    return StreamBuilder(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        final data = snapshot.data;

        if (data?.session?.user != null) {
          return Row(
            children: [
              ElevatedButton(
                style: outlinedStyle,
                onPressed: () {
                  // TODO: route to user profile
                },
                child: Text(
                  "My Profile",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                style: filledStyle,
                onPressed: () async {
                  await Supabase.instance.client.auth.signOut();

                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Successfully signed out!")));
                  }
                },
                child: Text(
                  "Logout",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          );
        } else {
          return Row(
            children: [
              ElevatedButton(
                style: outlinedStyle,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(width: 8),
              OutlinedButton(
                style: filledStyle,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SignupPage(),
                    ),
                  );
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}

Widget _hero(context) {
  return Container(
    alignment: Alignment.topLeft,
    width: MediaQuery.of(context).size.width,
    height: 750,
    color: Color(0xff153faa),
    child: Padding(
      padding: EdgeInsets.fromLTRB(180, 15, 15, 15),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "BE A ",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Text(
                  "CERTIFIED",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            Text(
              "PROFESSIONAL.",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Seize the opportunity to gain a competitive edge by mastering",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "essential skills. Unlock new horizons of expertise, from hands-on",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "learning experiences to industry-relevant skills. Delve into",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "specialized courses with Ateneo ICTC.",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ]),
    ),
  );
}

Widget _programs(context) {
  return Container(
      color: Color(0xfffff0),
      padding: const EdgeInsets.symmetric(vertical: 180.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Featured Programs",
                style: Theme.of(context).textTheme.bodyLarge),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildMicroCard(context),
                _buildGoogleCard(context),
                _buildSkillCard(context),
              ],
            ),
          ]));
}

Widget _buildMicroCard(context) {
  return Container(
    width: 400,
    height: 500,
    child: Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      color: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 2,
      child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("PROGRAM",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline)),
              SizedBox(height: 30),
              Text("Micro-credentials Program",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
              SizedBox(height: 20),
              Text(
                "short focused and competency based certifications that validate specific skills and knowledge in a particular area",
                maxLines: 3,
                textHeightBehavior: TextHeightBehavior(
                    applyHeightToFirstAscent: true,
                    applyHeightToLastDescent: true),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.school_rounded,
                      size: 14, color: Color(0xff153faa)),
                  SizedBox(width: 5),
                  Text(
                    "12 courses",
                    style: TextStyle(fontSize: 12, color: Color(0xff153faa)),
                  ),
                ],
              ),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FilledButton(
                      onPressed: () {},
                      child: Text("Explore Courses",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                    ),
                  ]),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: AspectRatio(
                  aspectRatio: 20 / 10,
                  child: Image.asset(
                    'assets/images/program1.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ],
          )),
    ),
  );
}

Widget _buildGoogleCard(context) {
  return Container(
    width: 400,
    height: 500,
    child: Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      color: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 2,
      child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("PROGRAM",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline)),
              SizedBox(height: 30),
              Text("Google Certified Educators",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
              SizedBox(height: 20),
              Text(
                "validate educators' proficiency in effectively integrating technology and Google tools to enhance teaching and learning experiences for students",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textHeightBehavior: TextHeightBehavior(
                    applyHeightToFirstAscent: true,
                    applyHeightToLastDescent: true),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.school_rounded,
                      size: 14, color: Color(0xff153faa)),
                  SizedBox(width: 5),
                  Text(
                    "12 courses",
                    style: TextStyle(fontSize: 12, color: Color(0xff153faa)),
                  ),
                ],
              ),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FilledButton(
                      onPressed: () {},
                      child: Text("Explore Courses",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                    ),
                  ]),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: AspectRatio(
                  aspectRatio: 20 / 10,
                  child: Image.asset(
                    'assets/images/program1.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ],
          )),
    ),
  );
}

Widget _buildSkillCard(context) {
  return Container(
    width: 400,
    height: 500,
    child: Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      color: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 2,
      child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("PROGRAM",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline)),
              SizedBox(height: 30),
              Text("Skill Up Program",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
              SizedBox(height: 20),
              Text(
                "acquire new skills or upgrade existing ones to enhance their employability and career prospects.",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textHeightBehavior: TextHeightBehavior(
                    applyHeightToFirstAscent: true,
                    applyHeightToLastDescent: true),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.school_rounded,
                      size: 14, color: Color(0xff153faa)),
                  SizedBox(width: 5),
                  Text(
                    "12 courses",
                    style: TextStyle(fontSize: 12, color: Color(0xff153faa)),
                  ),
                ],
              ),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FilledButton(
                      onPressed: () {},
                      child: Text("Explore Courses",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                    ),
                  ]),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: AspectRatio(
                  aspectRatio: 20 / 10,
                  child: Image.asset(
                    'assets/images/program1.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ],
          )),
    ),
  );
}
