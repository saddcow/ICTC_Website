import 'package:ICTC_Website/models/course.dart';
import 'package:ICTC_Website/models/program.dart';
import 'package:ICTC_Website/pages/desktop/footer.dart';
import 'package:ICTC_Website/widgets/appBarDesktop.dart';
import 'package:ICTC_Website/widgets/cards/course_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProgramPage extends StatefulWidget {
  const ProgramPage({super.key, required this.program});

  final Program program;

  @override
  State<ProgramPage> createState() => _ProgramPageState();
}

class _ProgramPageState extends State<ProgramPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDesktop(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHero(context), 
            _buildList(context),
            FooterWidget()
          ],
        ),
      ),
    );
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
              '${widget.program.title}',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.white, fontSize: 45),
            ),
            SizedBox(height: 50),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Text(
                '${widget.program.description}',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            )
          ]),
    );
  }

  Widget _buildList(BuildContext context) {
  return Container(
      //height: MediaQuery.of(context).size.height * 0.6,
      padding: EdgeInsets.symmetric(vertical: 80.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('${widget.program.title} Courses',
              style: Theme.of(context).textTheme.bodyLarge),
          SizedBox(height: 50),
          Padding(
            padding: EdgeInsets.only(left: 350, right: 350),
            child: FutureBuilder(
                future: Supabase.instance.client
                    .from('course')
                    .select()
                    .eq('program_id', widget.program.id)
                    .withConverter(
                        (data) => data.map((e) => Course.fromJson(e)).toList()),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasData) {
                    return GridView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(8),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.8,
                      ),
                      children: snapshot.data!
                          .map((e) => CourseCard(course: e))
                          .toList(),
                    );
                  }

                  return Center(
                    child: Text("No data found."),
                  );
                }),
          )
        ],
      ));
}
}
