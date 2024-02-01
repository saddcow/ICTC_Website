import 'package:ICTC_Website/pages/home.dart';
import 'package:ICTC_Website/pages/programs.dart';
import 'package:flutter/material.dart';

class MainNavigationBar extends StatefulWidget {
  const MainNavigationBar({super.key});

  @override
  State<MainNavigationBar> createState() => _MainNavigationBarState();
}

class _MainNavigationBarState extends State<MainNavigationBar> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = TextButton.styleFrom(
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(490.0),
        child: Container(
          child: const AppBarContent(),
        ),
      ),
    );
  }
}

class AppBarContent extends StatelessWidget {
  const AppBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 600) {
          return _buildWideContainers(context);
        } else {
          return _buildNormalContainer(context);
        }
      },
    );
  }
}

Widget _buildWideContainers(context) {
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

Widget _buildNormalContainer(context) {
  final ButtonStyle style = TextButton.styleFrom(
    foregroundColor: Theme.of(context).colorScheme.onPrimary,
  );
  return Scaffold(
      drawerScrimColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.5,
        title: const Text('Ateneo ICTC'),
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
              child: Text('Ateneo ICTC'),
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
