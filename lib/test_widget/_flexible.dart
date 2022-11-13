import 'package:flutter/material.dart';

void main() {
  runApp(new MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int count = 0;

  onPressCount() {
    setState(() {
      count += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text('Test 22')),
          body: Column(
            children: [
              Flexible(
                  flex: 1,
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.all(5),
                          color: Colors.amber,
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          color: Colors.green,
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  )),
              Flexible(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.all(5),
                    color: Colors.red,
                  )),
              Flexible(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(5),
                    color: Colors.blue,
                  )),
            ],
          )),
    );
  }
}
