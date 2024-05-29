import 'package:ICTC_Website/pages/desktop/programs/google_certified_educators.dart';
import 'package:ICTC_Website/pages/desktop/programs/microcredentials.dart';
import 'package:ICTC_Website/pages/desktop/programs/skillup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeMobilePage extends StatefulWidget {
  const HomeMobilePage({super.key});

  @override
  State<HomeMobilePage> createState() => _HomeMobilePageState();
}

class _HomeMobilePageState extends State<HomeMobilePage> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
    );

    return Scaffold(
      drawerScrimColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        elevation: 0.5,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Image.asset('assets/images/ictc_logo.png',
                  width: 60, height: 70),
            ),
            // Your widgets here
          ],
        ),
      ),
      endDrawer: Drawer(
        surfaceTintColor: Colors.black,
        elevation: 4,
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              child: Text('Ateneo ICTC', style: TextStyle(fontSize: 12)),
            ),
            ListTile(
                title: const Text('Home'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomeMobilePage()));
                }),
            ListTile(
              title: const Text('Programs'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MicrocredentialsPage()));
              },
            ),
          ],
        ),
      ), body: _hero(context),
      );
  }
}


Widget _hero(context) {
  return Container(
    alignment: Alignment.topLeft,
    width: MediaQuery.of(context).size.width,
    height: 750,
    color: Color(0xff153faa),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "BE A ",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Text(
                  "CERTIFIED",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            Text(
              "PROFESSIONAL.",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Seize the opportunity to gain a competitive edge by mastering",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "essential skills. Unlock new horizons of expertise, from hands-on",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "learning experiences to industry-relevant skills. Delve into",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "specialized courses with Ateneo ICTC.",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ]),
    ),
  );
}

