import 'package:ICTC_Website/pages/desktop/footer.dart';
import 'package:ICTC_Website/widgets/appBarDesktop.dart';
import 'package:flutter/material.dart';

class PreRegisterPage extends StatefulWidget {
  const PreRegisterPage({super.key});

  @override
  State<PreRegisterPage> createState() => _PreRegisterPageState();
}

class _PreRegisterPageState extends State<PreRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDesktop(),
      body: SingleChildScrollView(
        child: Expanded(
          flex: 1,
          child: Column(
            children: [_buildBox(context), FooterWidget()],
          ),
        ),
      ),
    );
  }
}

Widget _buildBox(context) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 180.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 840,
          height: 800,
          color: Color(0xFFF2F2F2),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 160.0, horizontal: 120.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Certified Artificial Intelligence Professional',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  'January 6 - 7, 2024',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Online Training',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  '₱ 5600',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(height: 40),
                FilledButton(
                  onPressed: () {}, 
                  child: Text(
                    'Pre-Register',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                    ),
                  )
                )
              ],
            ),
          ),
        ),
        Container(
          width: 840,
          height: 800,
          child: Image.asset(
            'assets/images/course1.png',
            fit: BoxFit.fill,
          ),
        )
      ],
    ),
  );
}
