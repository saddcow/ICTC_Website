import 'dart:ui';

import 'package:ICTC_Website/pages/desktop/footer.dart';
import 'package:ICTC_Website/widgets/appBarDesktop.dart';
import 'package:flutter/material.dart';
import 'package:ICTC_Website/pages/desktop/home.dart';

class GoogleCertifiedEducatorsPage extends StatelessWidget {
  const GoogleCertifiedEducatorsPage({super.key});

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
              _buildLevels(context),
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
    alignment: Alignment.topCenter,
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height * 0.6,
    color: Color(0xff19306B),
    // color: Color(0xff153faa),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Google Certified Educator",
            style: Theme.of(context)
                .textTheme
                .displayLarge
                ?.copyWith(color: Colors.white),
          ),
          SizedBox(
            height: 40,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "A program offered by Google for educators who use Google Workspace for Education (formerly known as G Suite for Education) in their",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "classrooms. The certification is designed to validate educators' proficiency in effectively integrating technology ",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "and Google tools to enhance teaching and learning experiences for students.",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              // SizedBox(
              //   height: 8,
              // ),
              // Text(
              //   "integrating technology and Google tools to enhance teaching and learning experiences for students.",
              //   style: Theme.of(context).textTheme.labelMedium,
              // ),
              // SizedBox(
              //   height: 8,
              // ),
            ],
          ),
        ]),
  );
}

Widget _buildLevels(context) {
  return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      color: Color(0xfffff0),
      child: Padding(
        padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Levels of Google Certified Educators Certification",
                  style: Theme.of(context).textTheme.bodyLarge),
              SizedBox(height: 50),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCard(context),
                  _buildCard(context),
                ],
              ),
            ]),
      ));
}

Widget _buildCard(context) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.7,
    height: 300,
    child: Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      color: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 2,
      child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SizedBox(height: 45),
              Text("Level 1 Google Certified Educator",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
              SizedBox(height: 20),
              Text(
                "This certification assesses educators' foundational skills in using Google Workspace tools for educational purposes.",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textHeightBehavior: TextHeightBehavior(
                    applyHeightToFirstAscent: true,
                    applyHeightToLastDescent: true),
              ),
              SizedBox(height: 35),
              // Row(
              //   children: [
              //     Icon(Icons.school_rounded,
              //         size: 14, color: Color(0xff153faa)),
              //     SizedBox(width: 5),
              //     Text(
              //       "12 courses",
              //       style: TextStyle(fontSize: 12, color: Color(0xff153faa)),
              //     ),
              //   ],
              // ),
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
                      child: Text("Pre-Register",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                    ),
                  ]),
              // Padding(
              //   padding: EdgeInsets.only(top: 40),
              //   child: AspectRatio(
              //     aspectRatio: 20 / 10,
              //     child: Image.asset(
              //       'assets/images/program1.png',
              //       fit: BoxFit.fitWidth,
              //     ),
              //   ),
              // ),
            ],
          )),
    ),
  );
}
