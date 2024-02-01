import 'package:flutter/material.dart';

class TabBar extends StatelessWidget {
  // const TabBar({super.key});

  // late final _tabController = TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 160),
        // height: MediaQuery.sizeOf(context).size.height,
        color: Colors.white,
        // child: Column(
        //   children: <Widget>[
        //     TabBar(
        //       controller: _tabController,
        //       tabs: const <Widget>[
        //         Tab(text: 'Overview'),
        //         Tab(text: 'Specifications'),
        //       ],
        //     ),
        //     Expanded(
        //       child: TabBarView(
        //         controller: _tabController,
        //         children: <Widget>[
        //           Card(
        //             margin: const EdgeInsets.all(16.0),
        //             child: Center(child: Text('Overview tab')),
        //           ),
        //           Card(
        //             margin: const EdgeInsets.all(16.0),
        //             child: Center(
        //                 child: Text(Specifications tab')),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
