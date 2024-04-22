import 'package:ICTC_Website/pages/desktop/programs/google_certified_educators.dart';
import 'package:flutter/material.dart';

class ProgramCardWidget extends StatelessWidget {
  const ProgramCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
}
