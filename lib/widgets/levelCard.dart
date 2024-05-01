import 'package:ICTC_Website/models/course.dart';
import 'package:ICTC_Website/pages/desktop/preregister.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LevelCard extends StatelessWidget {
  const LevelCard({super.key, required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: 300,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
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
                Text('${course.title}',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
                SizedBox(height: 20),
                Text(
                  '${course.description ?? "No description provided."}',
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
                                  PreRegisterPage(course: course),
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
}
