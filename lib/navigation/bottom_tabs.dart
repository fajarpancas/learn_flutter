import 'package:first_flutter/pages/chat_list.dart';
import 'package:first_flutter/pages/main_page.dart';
import 'package:first_flutter/pages/project.dart';
import 'package:flutter/material.dart';

class BottomTabs extends StatefulWidget {
  const BottomTabs({super.key});

  @override
  State<BottomTabs> createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  int _bottomNavCurrentIndex = 0;
  final List _container = [MainPage(), ChatList(), Project()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _container[_bottomNavCurrentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              _bottomNavCurrentIndex = value;
            });
          },
          iconSize: 25,
          selectedItemColor:
              _bottomNavCurrentIndex == 0 ? Colors.pink : Colors.blueAccent,
          currentIndex: _bottomNavCurrentIndex,
          items: const [
            BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: 'Chat', icon: Icon(Icons.chat)),
            BottomNavigationBarItem(label: 'Project', icon: Icon(Icons.work)),
          ]),
    );
  }
}
