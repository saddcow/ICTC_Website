import 'package:ICTC_Website/pages/desktop/footer.dart';
import 'package:ICTC_Website/widgets/appBarDesktop.dart';
import 'package:ICTC_Website/widgets/preRegisterForm.dart';
import 'package:flutter/material.dart';

class PreRegisterPage extends StatefulWidget {
  const PreRegisterPage({Key? key}) : super(key: key);

  @override
  State<PreRegisterPage> createState() => _PreRegisterPageState();
}

class _PreRegisterPageState extends State<PreRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDesktop(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildBox(context),
            FooterWidget(),
          ],
        ),
      ),
    );
  }
}

Widget _buildBox(context) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 40.0),
    child: SizedBox(
      width: 1690,
      height: 800,
      child: Card(
        elevation: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 840,
              height: 800,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                ),
                color: Color(0xFFF2F2F2),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 60.0, horizontal: 60.0),
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
                    SizedBox(height: 20),
                    Text(
                      'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'January 6 - 7, 2024',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Online Training',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 30),
                    Text(
                      '₱ 5600',
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 30),
                    registerButton(context),
                  ],
                ),
              ),
            ),
            Container(
                width: 840,
                height: 800,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                  child: Image.asset(
                    'assets/images/course1.png',
                    fit: BoxFit.fill,
                  ),
                ))
          ],
        ),
      ),
    ),
  );
}

Widget registerButton(context) {
  return FilledButton(
    onPressed: () {
      showDialog(
          context: context,
          builder: (context) {
            return registerDialog(context);
          });
    },
    child: Text(
      'Pre-Register',
      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
    ),
  );
}

Widget registerDialog(context) {
  return AlertDialog(
    contentPadding: const EdgeInsets.only(left: 20, right: 30, top: 40),
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: FractionalOffset.topRight,
          child: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        const Text(
          'Pre-Register',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        )
      ],
    ),
    content: Flexible(
      flex: 2,
      child: SizedBox(
          width: 550,
          height: MediaQuery.of(context).size.height * 0.4,
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [preRegisterForm()],
          ))),
    ),
  );
}
