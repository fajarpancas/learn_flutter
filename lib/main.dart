import 'package:first_flutter/pages/lifecycle_demo/lifecycle.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter/pages/login_page.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: LoginPage());
  }
}
