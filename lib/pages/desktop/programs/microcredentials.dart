import 'package:ICTC_Website/pages/desktop/about.dart';
import 'package:ICTC_Website/pages/desktop/footer.dart';
import 'package:ICTC_Website/pages/desktop/home.dart';
import 'package:ICTC_Website/widgets/appBarDesktop.dart';
import 'package:ICTC_Website/widgets/course_card.dart';
import 'package:ICTC_Website/widgets/sampleCourse.dart';
import 'package:flutter/material.dart';

class MicrocredentialsPage extends StatefulWidget {
  const MicrocredentialsPage({super.key});

  @override
  State<MicrocredentialsPage> createState() => _MicrocredentialsPageState();
}

class _MicrocredentialsPageState extends State<MicrocredentialsPage> {
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
              _buildList(context),
              FooterWidget()
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
    color: Color(0xFF19306B),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "MICRO-CREDENTIALS PROGRAM",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Colors.white, fontSize: 45),
          ),
          SizedBox(height: 50),
          characteristicsChips()
        ]),
  );
}

Widget _buildList(context) {
  return Container(
      //height: MediaQuery.of(context).size.height * 0.6,
      padding: EdgeInsets.symmetric(vertical: 180.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Micro-Credentials Courses",
              style: Theme.of(context).textTheme.bodyLarge),
          Padding(
            padding: EdgeInsets.only(left: 350, right: 350),
            child: GridView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                childAspectRatio: 0.8,
              ),
              children: <Widget>[
                CourseCard(),
                SampleCourseCard(),
                sample2(),
              ],
            ),
          )
        ],
      ));
}

Widget sample2() {
  return Container(
    width: 400,
    height: 500,
    child: Card(
      clipBehavior: Clip.antiAlias,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      color: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Micro-Credential",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline)),
                Text("₱ 5600")
              ],
            ),
            SizedBox(height: 20),
            Text("Certified Data Science Associate",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
            SizedBox(height: 20),
            Text("Lorem ipsum dolor sit amet chuchu chuchuness"),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FilledButton(
                    onPressed: () {},
                    child: Text(
                      "Pre-Register",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: AspectRatio(
                aspectRatio: 20 / 10,
                child: Image.asset(
                  'assets/images/course2.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


Widget characteristicsChips() {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Chip(
          backgroundColor: Color(0xFF19306B),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white, width: 1), // White border
            borderRadius: BorderRadius.circular(50),
          ),
          label: Text(
            "Focused Content",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(width: 20),
        Chip(
            backgroundColor: Color(0xFF19306B),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white, width: 1), // White border
              borderRadius: BorderRadius.circular(50),
            ),
            label: Text(
              "Short Duration",
              style: TextStyle(
                color: Colors.white,
              ),
            )),
        SizedBox(width: 20),
        Chip(
            backgroundColor: Color(0xFF19306B),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white, width: 1), // White border
              borderRadius: BorderRadius.circular(50),
            ),
            label: Text(
              "Flixible Learning Options",
              style: TextStyle(
                color: Colors.white,
              ),
            )),
        SizedBox(width: 20),
        Chip(
            backgroundColor: Color(0xFF19306B),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white, width: 1), // White border
              borderRadius: BorderRadius.circular(50),
            ),
            label: Text(
              "Stackable and Modular",
              style: TextStyle(
                color: Colors.white,
              ),
            )),
        SizedBox(width: 20),
        Chip(
            backgroundColor: Color(0xFF19306B),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white, width: 1), // White border
              borderRadius: BorderRadius.circular(50),
            ),
            label: Text(
              "Employer Recognition",
              style: TextStyle(
                color: Colors.white,
              ),
            )),
        SizedBox(width: 20),
        Chip(
          backgroundColor: Color(0xFF19306B),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white, width: 1), // White border
            borderRadius: BorderRadius.circular(50),
          ),
          label: Text(
            "Continuous Learning",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        )
      ],
    ),
  );
}
