import 'package:ICTC_Website/models/program.dart';
import 'package:ICTC_Website/pages/auth/login_page.dart';
import 'package:ICTC_Website/pages/auth/signup_page.dart';
import 'package:ICTC_Website/pages/desktop/footer.dart';
import 'package:ICTC_Website/pages/desktop/programs/google_certified_educators.dart';
import 'package:ICTC_Website/pages/desktop/programs/microcredentials.dart';
import 'package:ICTC_Website/pages/desktop/programs/skillup.dart';
import 'package:ICTC_Website/widgets/appBarDesktop.dart';
import 'package:ICTC_Website/widgets/program_card.dart';
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
    return Scaffold(
      appBar: AppBarDesktop(),
      body: SingleChildScrollView(
        child: Expanded(
          flex: 1,
          child: Column(
            children: [
              _buildHero(context),
              _buildPrograms(context),
              FooterWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildHero(context) {
  return Container(
    alignment: Alignment.topLeft,
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height * 0.7,
    color: Color(0xff19306B),
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

Widget _buildPrograms(context) {
  return Container(
      //height: MediaQuery.of(context).size.height * 0.8,
      color: Color(0xfffff0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 180.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Featured Programs",
                  style: Theme.of(context).textTheme.bodyLarge),
              SizedBox(height: 50),
              FutureBuilder(
                future: Supabase.instance.client
                    .from('program')
                    .select()
                    .withConverter((data) =>
                        data.map((e) => Program.fromJson(e)).toList()),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: snapshot.data!
                        .map((e) => ProgramCardWidget(program: e))
                        .toList(),
                  );
                },
              )
            ]),
      ));
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
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const MicrocredentialsPage(),
                          ),
                        );
                      },
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
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                const GoogleCertifiedEducatorsPage(),
                          ),
                        );
                      },
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
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SkillUpPage(),
                          ),
                        );
                      },
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
