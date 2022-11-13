import 'package:first_flutter/pages/lifecycle_demo/appstate_page.dart';
import 'package:first_flutter/pages/lifecycle_demo/simple_widget_page.dart';
import 'package:first_flutter/pages/lifecycle_demo/stateful_page.dart';
import 'package:first_flutter/pages/lifecycle_demo/stateless_page.dart';
import 'package:flutter/material.dart';

class LifecyclePage extends StatelessWidget {
  const LifecyclePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lifecycle')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return StatelessPage(headerTitle: 'Stateless Page');
                }));
              },
              child: const Text('Stateless Widget')),
          TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return StatefulPage(headerTitle: 'Stateful Page');
                }));
              },
              child: const Text('Stateful Widget')),
          TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const AppStatePage();
                }));
              },
              child: const Text('App Lifecycle')),
          TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SimpleWidget();
                }));
              },
              child: const Text('Simple Widget')),
        ],
      )),
    );
  }
}
