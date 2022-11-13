import 'package:first_flutter/custom/alert_dialog.dart';
import 'package:flutter/material.dart';

class SimpleWidget extends StatefulWidget {
  const SimpleWidget({super.key});

  @override
  State<SimpleWidget> createState() => _SimpleWidgetState();
}

class _SimpleWidgetState extends State<SimpleWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple Widget')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.pink,
        splashColor: Colors.greenAccent,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.red, width: 0.5),
          borderRadius: BorderRadius.circular(0),
        ),
        child: const Text('Hi!'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTextSample(),
            buildIconSample(),
            buildIconButtonSample(),
            buildImageSample(),
            buildButtonSample(),
            buildCardSample(),
            buildAlertDialog(context)
          ],
        ),
      ),
    );
  }

  Widget buildTextSample() => Container(
        width: 100 * MediaQuery.of(context).size.width / 375,
        margin: const EdgeInsets.all(20),
        color: Colors.red.shade100,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Textoverflowfade',
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  style: TextStyle(fontSize: 25)),
              Text('Textoverflowclip',
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  style: TextStyle(fontSize: 25)),
              Text('Textoverflowellipsis',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 25, color: Colors.white)),
              Text('Textoverflowvisible',
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.visible,
                  style: TextStyle(fontSize: 25)),
            ]),
      );

  Widget buildIconSample() => Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Icon(
              Icons.apple,
              size: 30,
              shadows: [
                Shadow(color: Colors.red, blurRadius: 2.0, offset: Offset(2, 2))
              ],
            ),
          ],
        ),
      );

  Widget buildIconButtonSample() => Center(
      child: IconButton(
          onPressed: () {}, icon: const Icon(Icons.apple, size: 30)));

  Widget buildImageSample() => Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 340 * MediaQuery.of(context).size.width / 375,
              height: 100 * MediaQuery.of(context).size.width / 375,
              margin: const EdgeInsets.only(bottom: 20),
              color: Colors.lightBlue,
              child: const Image(
                image: AssetImage("assets/shopee.png"),
                fit: BoxFit.contain,
              ),
            ),
            Image(
              width: 340,
              height: 100,
              image: const NetworkImage(
                  "https://asset.kompas.com/crops/pi3kG20B6HYl2enSgoI-JKuvn_4=/0x0:0x0/750x500/data/photo/2015/02/12/1621063spidermanp.jpg"),
              fit: BoxFit.contain,
              repeat: ImageRepeat.repeat,
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
          ],
        ),
      );

  Widget buildButtonSample() => Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {},
                style: const ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(Size(200, 50)),
                    backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.facebook),
                    Text('Login with facebook')
                  ],
                )),
            OutlinedButton(
                onPressed: () {},
                style: const ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(Size(200, 50)),
                  maximumSize: MaterialStatePropertyAll(Size(400, 50)),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.facebook),
                      Text('Login with facebook')
                    ]))
          ],
        ),
      );

  Widget buildCardSample() => Card(
        elevation: 5,
        shadowColor: Colors.red,
        color: Colors.yellowAccent,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.red, width: 1),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Container(
          margin: const EdgeInsets.all(40),
          child: const Icon(
            Icons.telegram,
            shadows: [
              Shadow(color: Colors.pink, blurRadius: 10, offset: Offset(3, 3))
            ],
            size: 120,
          ),
        ),
      );
}
