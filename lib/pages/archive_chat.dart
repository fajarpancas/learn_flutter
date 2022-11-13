import 'package:flutter/material.dart';

class ArchiveChat extends StatelessWidget {
  ArchiveChat({super.key});

  TabBar myTabBar = TabBar(
      labelColor: Colors.blueAccent,
      unselectedLabelColor: Colors.grey,
      tabs: [
        Tab(text: 'Archived'),
        Tab(text: 'Closed'),
      ]);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Archives'),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
          iconTheme: IconThemeData(color: Colors.blueAccent),
          backgroundColor: Colors.white,
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(myTabBar.preferredSize.height),
              child: Container(
                child: myTabBar,
              )),
        ),
        body: TabBarView(children: [
          Center(
            child: Text('Tab Archived'),
          ),
          Center(
            child: Text('Tab Closed'),
          )
        ]),
      ),
    );
  }
}
