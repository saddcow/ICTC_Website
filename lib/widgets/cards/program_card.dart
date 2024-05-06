import 'package:ICTC_Website/models/program.dart';
import 'package:ICTC_Website/widgets/programPage.dart';
import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';

class ProgramCardWidget extends StatelessWidget {
  const ProgramCardWidget({Key? key, required this.program}) : super(key: key);

  final Program program;

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
              Text('${program.title}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
              SizedBox(height: 20),
              Text(
                '${HtmlUnescape().convert(program.description ?? "No description provided.")}',
                maxLines: 3,
                textHeightBehavior: TextHeightBehavior(
                    applyHeightToFirstAscent: true,
                    applyHeightToLastDescent: true),
              ),
              SizedBox(height: 20),
              
              Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FilledButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProgramPage(program: program)));
                        // Navigator.of(context).pushNamed(program.route ?? "/home");
                      },  
                      child: Text("Explore Courses",
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
