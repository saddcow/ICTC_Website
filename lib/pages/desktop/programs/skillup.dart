import 'package:ICTC_Website/pages/desktop/footer.dart';
import 'package:ICTC_Website/widgets/appBarDesktop.dart';
import 'package:flutter/material.dart';
import 'package:ICTC_Website/pages/desktop/home.dart';

class SkillUpPage extends StatefulWidget {
  const SkillUpPage({super.key});

  @override
  State<SkillUpPage> createState() => _SkillUpPageState();
}

class _SkillUpPageState extends State<SkillUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDesktop(),
      body: SingleChildScrollView(
        child: Column(
          children: [_buildHero(context), _buildList(context), FooterWidget()],
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
            "Skill-Up Program",
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
                "Ateneo ICTC's training or educational initiative designed to help individuals",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "acquire new skills or upgrade existing ones to enhance their employability and career prospects.",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              // SizedBox(
              //   height: 8,
              // ),
              // Text(
              //   "and Google tools to enhance teaching and learning experiences for students.",
              //   style: Theme.of(context).textTheme.labelMedium,
              // ),
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

Widget _buildList(context) {
  return Container(
      color: Color(0xfffff0),
      padding: const EdgeInsets.symmetric(vertical: 180.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            //height: MediaQuery.of(context).size.height * 0.6,
            padding: EdgeInsets.only(left: 350, right: 350),
            child: GridView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                childAspectRatio: 1.5,
              ),
              children: <Widget>[
                _buildCard(context),
                _buildCard(context),
                _buildCard(context),
                _buildCard(context),
                _buildCard(context),
                _buildCard(context),
              ],
            ),
          ),
        ],
      ));
}

Widget _buildKeyCharacteristics(context) {
  return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      color: Color(0xfffff0),
      child: Padding(
        padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Key Characteristics",
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
    //width: 400,
    //height: 500,
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
              Text("COURSE",
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
                      onPressed: () {},
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
  );
}
