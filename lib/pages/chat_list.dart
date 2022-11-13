import 'package:first_flutter/chat/channel_row_item.dart';
import 'package:first_flutter/custom/bottom_modal.dart';
import 'package:first_flutter/pages/archive_chat.dart';
import 'package:first_flutter/pages/chat_detail.dart';
import 'package:first_flutter/model/channels_model.dart';
import 'package:flutter/material.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  List<Channel> channels = [
    Channel('1', 'VirtualSpirit', 'assets/vs.png',
        'Nicholas Ng Hui Sui: Hello guys!', '23-09-2022'),
    Channel('2', 'Shopee', 'assets/shopee.png',
        'Shopee: Selamat kamu dapat HADIAH! Hai, kak Fajar', '22-09-2022')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 15),
          child: const Text(
            'Chats',
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        leadingWidth: 200,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        actionsIconTheme: const IconThemeData(color: Colors.black, size: 30),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ArchiveChat()));
              },
              icon: const Icon(Icons.archive)),
          IconButton(onPressed: () {}, icon: Icon(Icons.camera)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),
      floatingActionButton: floatingModalAction(context, (value) => {}),
      body: RefreshIndicator(
        onRefresh: () async {
          return Future<void>.delayed(const Duration(seconds: 3));
        },
        child: ListView(padding: EdgeInsets.all(15), children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: const Text('CHATS'),
          ),
          Column(
            children: channels
                .map((channel) => ChannelRowItem(
                    context,
                    channel.channelAvatar,
                    channel.channelName,
                    channel.lastMessage,
                    channel.timetoken,
                    () => {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ChatDetail(channel: channel);
                          }))
                        }))
                .toList(),
          )
        ]),
      ),
    );
  }
}
