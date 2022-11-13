import 'package:flutter/material.dart';

class ResponsivePage extends StatelessWidget {
  const ResponsivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              height: (300 * MediaQuery.of(context).size.width) / 600,
              width: (300 * MediaQuery.of(context).size.width) / 428,
              color: Colors.amberAccent,
              child: Text('TEST SCREEN RESPONSIVE'),
            ),
            Container(
              alignment: Alignment.center,
              height: (300 * MediaQuery.of(context).size.width) / 600,
              width: (128 * MediaQuery.of(context).size.width) / 428,
              color: Colors.redAccent,
              child: Text('TEST SCREEN RESPONSIVE'),
            ),
          ],
        ),
      ),
    );
  }
}
