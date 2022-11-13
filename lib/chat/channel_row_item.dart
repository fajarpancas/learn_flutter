import 'package:first_flutter/chat/avatar.dart';
import 'package:first_flutter/pages/chat_detail.dart';
import 'package:flutter/material.dart';

GestureDetector ChannelRowItem(context, String channelAvatar,
    String channelName, String lastMessage, String timetoken, onPress) {
  return GestureDetector(
    onTap: () {
      onPress();
    },
    child: Row(
      children: [
        Avatar(channelAvatar, 50, 50),
        Container(
          margin: EdgeInsets.only(left: 10),
          padding: EdgeInsets.only(top: 10, bottom: 10),
          decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Colors.black26, width: 0.5)),
          ),
          child: Row(
            children: [
              Container(
                width: 370 * MediaQuery.of(context).size.width / 600,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      channelName,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        maxLines: 1,
                        lastMessage,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black87,
                            fontWeight: FontWeight.w300),
                      ),
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(timetoken,
                      style: TextStyle(color: Colors.black45, fontSize: 12)),
                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    child: Center(
                        child: Text('1',
                            style:
                                TextStyle(color: Colors.white, fontSize: 10))),
                    width: (20 * MediaQuery.of(context).size.width) / 375,
                    height: (20 * MediaQuery.of(context).size.width) / 375,
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.all(Radius.circular(12.5))),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
