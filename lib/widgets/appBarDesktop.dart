import 'package:ICTC_Website/main.dart';
import 'package:ICTC_Website/models/program.dart';
import 'package:ICTC_Website/pages/auth/login_page.dart';
import 'package:ICTC_Website/pages/auth/signup_page.dart';
import 'package:ICTC_Website/pages/desktop/profile/profile_page.dart';
import 'package:ICTC_Website/widgets/programPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppBarDesktop extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(70);

  const AppBarDesktop({Key? key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
    );

    late final _stream = Supabase.instance.client
        .from('program')
        .select()
        .withConverter((data) => data.map((e) => Program.fromJson(e)).toList())
        .asStream();
        
    return Scaffold(
      appBar: AppBar(
        primary: true,
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0.5,
        title: Padding(
          padding: const EdgeInsets.only(left: 36.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MainApp(),
                  ),
                ),
                icon: Image.asset('assets/images/logo_ictc.png',
                    width: 45, height: 45),
                label: Text(
                  "Ateneo ICTC",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff19306B)),
                ),
              )
              // Your widgets here
            ],
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 36.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    StreamBuilder<List<Program>>(
                      stream: _stream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<Program> programs = snapshot.data!;
                          return PopupMenuButton<String>(
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14),
                              child: Row(
                                children: [
                                  Text(
                                    "Programs",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff19306B)),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Icon(
                                    CupertinoIcons.chevron_down,
                                    size: 9,
                                    color: Color(0xff19306B),
                                  ),
                                ],
                              ),
                            ),
                            tooltip: "View more programs",
                            itemBuilder: (BuildContext context) {
                              return [
                                for (Program program in programs)
                                  buildProgramMenuItem(context, program),
                              ];
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Text("Error: ${snapshot.error}");
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                    ),
                    SizedBox(width: 16),
                    _buildButtons(context)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  PopupMenuItem<String> buildProgramMenuItem(
      BuildContext context, Program program) {
    return PopupMenuItem<String>(
      value: program.title,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProgramPage(program: program),
          ),
        );
      },
      child: Text('${program.title}'),
    );
  }

  Widget _buildButtons(BuildContext context) {
    final ButtonStyle filledStyle = ElevatedButton.styleFrom(
      onPrimary: Theme.of(context).colorScheme.onSecondary,
      primary: Theme.of(context).colorScheme.onPrimary,
    );
    final ButtonStyle outlinedStyle = OutlinedButton.styleFrom(
      side: BorderSide(width: 1, color: Color(0xff153faa)),
      onSurface: Colors.white,
      primary: Theme.of(context).colorScheme.onPrimary,
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
    );

    return StreamBuilder(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        final data = snapshot.data;

        if (data?.session?.user != null) {
          return Row(
            children: [
              PopupMenuButton(
                padding: EdgeInsets.all(0),
                surfaceTintColor: Colors.white,
                elevation: 4,
                offset: Offset.fromDirection(90, 10),
                position: PopupMenuPosition.under,
                icon: Icon(
                  Icons.person,
                  color: Color(0xff19306B),
                ),
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ProfilePage(),
                          ),
                        );
                      },
                      child: ListTile(
                        leading: Icon(Icons.person),
                        title: Text(
                          "My Profile",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () async {
                        await Supabase.instance.client.auth.signOut();
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Successfully signed out!")));
                        }
                      },
                      child: ListTile(
                        leading: Icon(Icons.logout),
                        title: Text(
                          "Logout",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    )
                  ];
                },
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
