import 'package:flutter/material.dart';
import '../const.dart';
import '../models/message.dart';
import '../models/user.dart';
import '../services/message_service.dart';
import '../widgets/suggested_contact.dart';
import '../widgets/recent_chat.dart';

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

  Widget buildSuggestedContactsWidget() {
    List<User> users = messageService.getUsers();

    return SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black12,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: users.length,
                itemBuilder: (BuildContext context, int index) {
                  final User user = users[index];
                  return SuggestedContact(user: user);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRecentChatsWidget() {
    List<Message> chats = messageService.getChats();

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(36.0),
          topRight: Radius.circular(36.0),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(36.0),
          topRight: Radius.circular(36.0),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
          child: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (BuildContext context, int index) {
              final Message message = chats[index];
              return RecentChat(message: message);
            },
          ),
        ),
      ),
    );
  }
}
