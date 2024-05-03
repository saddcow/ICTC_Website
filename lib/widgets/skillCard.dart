import 'package:ICTC_Website/models/course.dart';
import 'package:ICTC_Website/pages/desktop/preRegister/preregister.dart';
import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
class SkillCard extends StatelessWidget {
  const SkillCard({super.key, required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 400, 
          maxHeight: MediaQuery.of(context).size.height * 0.8
        ),
      // width: 400,
      // height: 700,
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
                Text("Skill-Up",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline)),
                SizedBox(height: 30),
                Text('${course.title}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                SizedBox(height: 20),
                Text(
                  '${HtmlUnescape().convert(course.description ?? "No description provided.")}',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textHeightBehavior: TextHeightBehavior(
                      applyHeightToFirstAscent: true,
                      applyHeightToLastDescent: true),
                ),
                SizedBox(height: 20),
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
                              PreRegisterPage(course: course)));
                        },
                        child: Text("Pre-register",
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
        ),
    );
  }
}