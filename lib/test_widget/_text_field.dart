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
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
        backgroundColor: Colors.red.shade200,
        appBar: AppBar(
          leading: Icon(Icons.add_business_rounded, color: Colors.white),
          title: Text(
            "Appbar Example",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.ac_unit)),
            IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
            IconButton(onPressed: () {}, icon: Icon(Icons.logout))
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.pink, Colors.red],
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.bottomRight)),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text(usernameController.text),
              TextField(
                decoration: InputDecoration(
                    icon: Icon(Icons.abc_rounded),
                    fillColor: Colors.white,
                    filled: true,
                    suffixIcon: Icon(
                      Icons.safety_check,
                      color: Colors.pink,
                    ),
                    suffixStyle: TextStyle(color: Colors.pink),
                    suffixText: 'tesss',
                    label: Icon(
                      Icons.event_repeat,
                      size: 30,
                    ),
                    hintText: "Tulis disini",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.black, width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.greenAccent))),
                controller: usernameController,
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
