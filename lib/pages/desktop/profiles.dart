import 'package:ICTC_Website/pages/desktop/attendedDetails.dart';
import 'package:ICTC_Website/pages/desktop/editProfile.dart';
import 'package:ICTC_Website/pages/desktop/pendingDetails.dart';
import 'package:flutter/material.dart';
import 'package:ICTC_Website/pages/desktop/footer.dart';
import 'package:ICTC_Website/widgets/appBarDesktop.dart';


class ProfilesPage extends StatefulWidget {
  const ProfilesPage({Key? key}) : super(key: key);

  @override
  State<ProfilesPage> createState() => _ProfilesPageState();
}

class _ProfilesPageState extends State<ProfilesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDesktop(),
      body: SingleChildScrollView(
        child: Column(
          children: [_buildPlacer(context), FooterWidget()],
        ),
      ),
    );
  }
}

Widget _buildPlacer(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 100, vertical: 100),
    child: Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: Colors.black.withOpacity(0.1),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  profileDetails(context),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [attendedCard(context), pendingCard(context)],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ),
  );
}

Widget profileDetails(BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.35,
    height: MediaQuery.of(context).size.height * 0.75,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
      ),
      color: Colors.white,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(80, 10, 80, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Profile',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EditProfile())
                    );
                  },
                  icon: Icon(Icons.create_sharp),
                ),
              ],
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Image.asset('assets/images/squid.png'),
              ),
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Squidward Tentacles',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  '+639454999222',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'stentacles80@gmail.com',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget attendedCard(BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.35,
    height: MediaQuery.of(context).size.height * 0.35,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
      ),
      color: Colors.white,
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Text('Attended Programs/Courses',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            Divider(),
            attendedContent(),
          ],
        ),
      ),
    ),
  );
}

Widget pendingCard(BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.35,
    height: MediaQuery.of(context).size.height * 0.35,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
      ),
      color: Colors.white,
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Text(
                'Pending Programs/Courses',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Divider(),
            Expanded(
              child: SingleChildScrollView(
                child: pendingContent(),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


Widget pendingContent() {
  List<String> pendingItems = [
    'Pending Item 1',
    'Pending Item 2',
    'Pending Item 3',
  ];

  return ListView.builder(
    shrinkWrap: true,
    itemCount: pendingItems.length,
    itemBuilder: (context, index) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Text(
                pendingItems[index],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PendingDetails()
                  )
                );
              },
              icon: Icon(Icons.remove_red_eye),
            ),
          ],
        ),
      );
    },
  );
}

Widget attendedContent() {
  List<String> attendedItems = [
    'Attended Item 1',
    'Attended Item 2',
    'Attended Item 3',
  ];

  return ListView.builder(
    shrinkWrap: true,
    itemCount: attendedItems.length,
    itemBuilder: (context, index) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Text(
                attendedItems[index],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AttendedDetails()
                  )
                );
              },
              icon: Icon(Icons.remove_red_eye),
            ),
          ],
        ),
      );
    },
  );
}
