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
          body: Column(children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.amberAccent,
              padding: EdgeInsets.all(3),
              child: Image(
                image: NetworkImage(
                    "https://asset.kompas.com/crops/pi3kG20B6HYl2enSgoI-JKuvn_4=/0x0:0x0/750x500/data/photo/2015/02/12/1621063spidermanp.jpg"),
                fit: BoxFit.contain,
                repeat: ImageRepeat.noRepeat,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              ),
            ),
            Container(
              width: 200,
              height: 200,
              color: Colors.green,
              padding: EdgeInsets.all(3),
              child: Image(
                image: AssetImage("assets/shopee.png"),
                fit: BoxFit.contain,
              ),
            ),
          ])),
    );
  }
}
