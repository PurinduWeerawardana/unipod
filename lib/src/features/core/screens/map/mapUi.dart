import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import '../chat/models/message.dart';
import '../chat/models/user.dart';
import '../chat/services/message_service.dart';
import '../chat/widgets/recent_chat.dart';
import '../chat/widgets/suggested_contact.dart';


class MapUI extends StatefulWidget {
  const MapUI({Key? key}) : super(key: key);

  @override
  State<MapUI> createState() => _MapUIState();
}


class _MapUIState extends State<MapUI> {
  final MessageService messageService = MessageService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Discover Nearby People',
            style: TextStyle(
                fontSize: 18.0,
                color: Color(0xFF000000),
                fontWeight: FontWeight.w400,
                fontFamily: "Poppins")),
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox.fromSize(size: Size(0,50)),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: RippleAnimation(
          color: Colors.grey,
          delay: Duration(milliseconds: 300),
          repeat: true,
          minRadius: 75,
          ripplesCount: 8,
          duration: Duration(milliseconds: 8 * 300),
          child: CircleAvatar(
              minRadius: 75,
              maxRadius: 75,
              backgroundImage: NetworkImage('https://blogger.googleusercontent.com/img/a/AVvXsEjA3yU3DQvoZfKBHzkcIumfUyxaUYDVVWSQcu5ikh8PW_UQx_wxTNivemQn1MY1TsjvFVDesueMPmTk-FWnYErepqHjvi9Ni4hSTvhlNfFIBsOLYjCnfq4sxeTkVNPjm7GApYXQSRd3Bwe7I06FqWu8Ja2W7VM7nsJf-ZwO59ckAJvjD2_cI0TjEwVE=s895'),
          ),
      ),
            ),
            SizedBox.fromSize(size: Size(10, 10)),
          ]
        )],
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
