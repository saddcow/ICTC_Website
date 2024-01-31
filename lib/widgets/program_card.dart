import 'package:flutter/material.dart';

class ProgramCard extends StatelessWidget {
  const ProgramCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 500,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: Colors.white,
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
                Text("Micro Credentials",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
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
                    Icon(Icons.abc_outlined,
                        size: 14, color: Color(0xff153faa)),
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
                    aspectRatio: 10 / 5,
                    child: Image.asset(
                      'assets/images/program1.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ],
            )

            //   SizedBox(
            //     height: 10,
            //   ),
            //   Text("Micro Credentials",
            //       style:
            //           TextStyle(fontSize: 40, fontWeight: FontWeight.w700)),
            //   SizedBox(
            //     height: 10,
            //   ),
            //   Text("Description here",
            //       style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400))
            // ]
            ),
      ),
    );
  }
}
