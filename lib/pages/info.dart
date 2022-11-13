import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  //constructor
  final String titleBar;
  InfoPage({super.key, required this.titleBar}) {
    print(titleBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titleBar)),
    );
  }
}
