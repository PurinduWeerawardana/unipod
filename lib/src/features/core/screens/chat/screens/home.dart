import 'package:flutter/material.dart';
import '../const.dart';
import '../models/message.dart';
import '../models/user.dart';
import '../services/message_service.dart';


class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final MessageService messageService = MessageService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back, color: Colors.black),
        //   onPressed: () => Navigator.of(context).pop(),
        // ),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 97, 97, 97),
        toolbarHeight: 120,
        title: const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text(
            "Friends Found \nNear by",
            style: TextStyle(
              fontSize: 26,
              fontFamily: 'Metropolis Black',
              fontWeight: FontWeight.bold,
              color: Colors.white,
              wordSpacing: 1.1,
              letterSpacing: 1.1,
            ),
          ),
        ),
      ),
      body: Container(
        color: Color.fromARGB(255, 97, 97, 97),
        child: Column(
          children: [
            buildSuggestedContactsWidget(),
            Expanded(
              child: buildRecentChatsWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
