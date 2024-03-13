import 'package:ICTC_Website/pages/desktop/about.dart';
import 'package:ICTC_Website/pages/desktop/footer.dart';
import 'package:ICTC_Website/pages/desktop/home.dart';
import 'package:ICTC_Website/widgets/appBarDesktop.dart';
import 'package:ICTC_Website/widgets/course_card.dart';
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
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.6,
    child: GridView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        childAspectRatio: 2,
      ),
      children: <Widget>[
        CourseCard(),
      ],
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
          )
        ),
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
          )
        ),
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
          )
        ),
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
          )
        ),
        SizedBox(width: 20),
        Chip(
          backgroundColor: Color(0xFF19306B),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white, width: 1), // White border
            borderRadius: BorderRadius.circular(50),
          ),
          label: Text(
            "Continuos Learning",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        )
      ],
    ),
  );
}
