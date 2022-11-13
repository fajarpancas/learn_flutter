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
          body: Stack(
            children: <Widget>[
              //background
              Column(
                children: [
                  Flexible(
                      flex: 1,
                      child: Row(
                        children: [
                          Flexible(
                              flex: 1,
                              child: Container(
                                color: Colors.white,
                              )),
                          Flexible(
                              flex: 1,
                              child: Container(
                                color: Colors.black12,
                              ))
                        ],
                      )),
                  Flexible(
                      flex: 1,
                      child: Row(
                        children: [
                          Flexible(
                              flex: 1,
                              child: Container(
                                color: Colors.black12,
                              )),
                          Flexible(
                              flex: 1, child: Container(color: Colors.white))
                        ],
                      ))
                ],
              ),
              //listview dengan text
              ListView(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                          "Ini adalah text yang ada di lapisan tengan dari stack",
                          style: TextStyle(
                              fontFamily: 'SouthAustralia', fontSize: 50),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                          "Ini adalah text yang ada di lapisan tengan dari stack",
                          style: TextStyle(
                              fontFamily: 'SouthAustralia', fontSize: 50),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                          "Ini adalah text yang ada di lapisan tengan dari stack",
                          style: TextStyle(
                              fontFamily: 'SouthAustralia', fontSize: 50),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                          "Ini adalah text yang ada di lapisan tengan dari stack",
                          style: TextStyle(
                              fontFamily: 'SouthAustralia', fontSize: 50),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                          "Ini adalah text yang ada di lapisan tengan dari stack",
                          style: TextStyle(
                              fontFamily: 'SouthAustralia', fontSize: 50),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                          "Ini adalah text yang ada di lapisan tengan dari stack",
                          style: TextStyle(
                              fontFamily: 'SouthAustralia', fontSize: 50),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                          "Ini adalah text yang ada di lapisan tengan dari stack",
                          style: TextStyle(
                              fontFamily: 'SouthAustralia', fontSize: 50),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              //button di tengah bawah
              Align(
                alignment: Alignment(0.75, 0.75),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'My button',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellowAccent),
                ),
              )
            ],
          )),
    );
  }
}
