import 'package:ICTC_Website/pages/about.dart';
import 'package:ICTC_Website/pages/programs.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // with SingleTickerProviderStateMixin {
  // late final _tabController = TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      double availWidth = constraints.maxWidth;

      if (availWidth >= 600) {
        return _buildWideScreen(context);
      } else {
        //small screens
        return _buildSmallScreen(context);
      }
    });
    // return Scaffold(
    //   resizeToAvoidBottomInset: false,
    //   appBar: PreferredSize(
    //     preferredSize: const Size.fromHeight(kToolbarHeight),
    //     child: Container(
    //       child: const AppBarContent(),
    //     ),
    //   ),
    //   body:
    //   SingleChildScrollView(
    //     child: Column(
    //       children: [
    //         _hero(context),
    //         // _tabBar(_tabController),
    //       ],
    //     ),
    //   ),
    // );
  }
}

Widget _buildWideScreen(context) {
  const double toolBarHeight = 60;
  return Scaffold(
    resizeToAvoidBottomInset: false,
    appBar: PreferredSize(
      preferredSize: const Size.fromHeight(toolBarHeight),
      child: Container(
        child: const AppBarContent(),
      ),
    ),
    body: _heroWide(context),
  );
}

Widget _buildSmallScreen(context) {
  const double toolBarHeight = 60;
  return Scaffold(
    resizeToAvoidBottomInset: false,
    appBar: PreferredSize(
      preferredSize: const Size.fromHeight(toolBarHeight),
      child: Container(
        child: const AppBarContent(),
      ),
    ),
    body: _heroSmall(context),
  );
}

// NAV BAR app content (ALL)
class AppBarContent extends StatelessWidget {
  const AppBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 600) {
          return _buildWideNavBar(context);
        } else {
          return _buildSmallNavBar(context);
        }
      },
    );
  }
}

// NAV BAR = WIDE (PC)
/////////////////////////////////////////
Widget _buildWideNavBar(context) {
  final ButtonStyle style = TextButton.styleFrom(
    foregroundColor: Theme.of(context).colorScheme.onPrimary,
  );

  final ButtonStyle filledStyle = FilledButton.styleFrom(
    foregroundColor: Theme.of(context).colorScheme.onSecondary,
    backgroundColor: Theme.of(context).colorScheme.onPrimary,
  );
  return Scaffold(
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
      actions: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextButton(
              style: style,
              onPressed: () {},
              child: const Text('About Us'),
            ),
            TextButton(
              style: style,
              onPressed: () {},
              child: const Text('Programs'),
            ),
            ElevatedButton(
              style: filledStyle,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              child: Text(
                "Sign Up",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

// NAV BAR = NORMAL (CP)
Widget _buildSmallNavBar(context) {
  final ButtonStyle style = TextButton.styleFrom(
    foregroundColor: Theme.of(context).colorScheme.onPrimary,
  );
  return Scaffold(
      drawerScrimColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                      builder: (context) => const HomePage()));
                }),
            ListTile(
              title: const Text('Programs'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ProgramsPage()));
              },
            ),
          ],
        ),
      ));
}
/////////////////////////////////////////

// HERO HEADER (PC)
Widget _heroWide(context) {
  return Container(
    alignment: Alignment.topLeft,
    width: MediaQuery.of(context).size.width,
    height: 750,
    color: Color(0xff153faa),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "BE A ",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Text(
                  "CERTIFIED",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            Text(
              "PROFESSIONAL.",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Seize the opportunity to gain a competitive edge by mastering",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "essential skills. Unlock new horizons of expertise, from hands-on",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "learning experiences to industry-relevant skills. Delve into",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "specialized courses with Ateneo ICTC.",
                  style: Theme.of(context).textTheme.labelMedium,
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
// HERO HEADER (PC)

Widget _heroSmall(context) {
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
// TAB BAR (PC)
// Widget _tabBar(_tabController) {
//   return Container(
//     margin: EdgeInsets.symmetric(vertical: 0, horizontal: 160),
//     height: 70,
//     color: Colors.white,
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         TabBar(
//           unselectedLabelColor: Colors.black,
//           labelColor: Colors.red,
//           tabs: [
//             Tab(
//               text: "Latest Programs",
//             ),
//             Tab(
//               text: "Popular Courses",
//             ),
//             Tab(
//               text: "New Courses",
//             )
//           ],
//           controller: _tabController,
//           indicatorSize: TabBarIndicatorSize.tab,
//         ),
//         Expanded(
//           flex: 1,
//           child: TabBarView(
//             viewportFraction: 3.0,
//             physics: NeverScrollableScrollPhysics(),
//             children: [
//               Container(height: 500, color: Colors.grey),
//               Container(color: Colors.grey),
//               Container(color: Colors.grey),
//             ],
//             controller: _tabController,
//           ),
//         ),
//       ],
//     ),
//   );
// }
