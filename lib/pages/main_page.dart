import 'package:first_flutter/model/user.dart';
import 'package:first_flutter/pages/info.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home, color: Colors.white),
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return InfoPage(titleBar: 'Info');
                }));
              },
              icon: const Icon(Icons.info_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.pink, Colors.red],
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.bottomRight)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          // Text(user.email),
          const Text(
            'Headline',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 200.0,
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 15,
              itemBuilder: (BuildContext context, int index) => Card(
                child: Center(child: Text('Dummy Card Text')),
              ),
            ),
          ),
          Text(
            'Demo Headline 2',
            style: TextStyle(fontSize: 18),
          ),
          Column(
            children: [
              Container(
                height: 200,
                width: 300,
                color: Colors.amber,
              ),
              Container(
                height: 200,
                width: 300,
                color: Colors.red,
              ),
              Container(
                height: 200,
                width: 300,
                color: Colors.green,
              ),
              Container(
                height: 200,
                width: 300,
                color: Colors.black,
              ),
              Container(
                height: 200,
                width: 300,
                color: Colors.amber,
              ),
              Container(
                height: 200,
                width: 300,
                color: Colors.amber,
              ),
              Container(
                height: 200,
                width: 300,
                color: Colors.amber,
              ),
              Container(
                height: 200,
                width: 300,
                color: Colors.amber,
              ),
            ],
          )
          // Column(
          //     children: news
          //         .map((n) => Container(
          //               child: Text(n.title),
          //             ))
          //         .toList())
        ]),
      ),
    ));
  }
}
