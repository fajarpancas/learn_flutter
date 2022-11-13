import 'package:flutter/material.dart';

class StatelessPage extends StatelessWidget {
  final String headerTitle;
  StatelessPage({super.key, required this.headerTitle}) {
    print('constuctor..');
  }

  @override
  Widget build(BuildContext context) {
    print('build()');
    return Scaffold(
      appBar: AppBar(title: Text(headerTitle)),
    );
  }
}
