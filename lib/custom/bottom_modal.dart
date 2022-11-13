import 'package:first_flutter/pages/archive_chat.dart';
import 'package:flutter/material.dart';

Widget buildActions(context, String title, Function onPress, color) {
  return GestureDetector(
    onTap: () {
      onPress();
    },
    child: Container(
      padding: EdgeInsets.only(top: 15, bottom: 15),
      width: 335 * MediaQuery.of(context).size.width / 375,
      child: Center(
          child: Text(
        title,
        style: TextStyle(color: color),
      )),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Colors.black26, width: 0.5))),
    ),
  );
}

Widget floatingModalAction(context, onPressAction) {
  return FloatingActionButton(
      backgroundColor: Colors.blueAccent,
      child: Icon(
        Icons.add,
        size: 25,
      ),
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) {
            return Container(
              height: 330 * MediaQuery.of(context).size.width / 600,
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    width: 337 * MediaQuery.of(context).size.width / 375,
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: Colors.black26, width: 0.5))),
                    child: const Center(
                        child: Text(
                      'Add to Workspace',
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    )),
                  ),
                  buildActions(context, 'Invite prople', () {
                    Navigator.pop(context);
                  }, Colors.black),
                  buildActions(context, 'New Channel', () {
                    Navigator.pop(context);
                  }, Colors.black),
                  buildActions(context, 'Chat with Your Team', () {
                    Navigator.pop(context);
                  }, Colors.black),
                  buildActions(context, 'CANCEL', () {
                    Navigator.pop(context);
                  }, Colors.red)
                ],
              ),
            );
          },
        );
      });
}
