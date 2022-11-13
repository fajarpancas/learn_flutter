import 'package:first_flutter/chat/avatar.dart';
import 'package:first_flutter/model/channels_model.dart';
import 'package:flutter/material.dart';

class ChatDetail extends StatelessWidget {
  final Channel channel;
  ChatDetail({required this.channel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blueAccent),
        backgroundColor: Colors.white,
        title: Container(
          child: Row(children: [
            Avatar(channel.channelAvatar, 45, 45),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      channel.channelName,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.group,
                        size: 16,
                        color: Colors.black54,
                      ),
                      Text('40',
                          style:
                              TextStyle(fontSize: 13, color: Colors.black54)),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Icon(Icons.circle,
                            size: 10, color: Colors.greenAccent),
                      ),
                      Text('10 Online',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black54,
                          )),
                    ],
                  ),
                ],
              ),
            )
          ]),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.search), color: Colors.black),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.info_outline, color: Colors.black))
        ],
      ),
    );
  }
}
