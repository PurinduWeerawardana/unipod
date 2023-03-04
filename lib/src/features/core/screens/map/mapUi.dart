import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import '../chat/models/message.dart';
import '../chat/models/user.dart';
import '../chat/services/message_service.dart';
import '../chat/widgets/suggested_contact.dart';


class MapUI extends StatefulWidget {
  const MapUI({Key? key}) : super(key: key);

  @override
  State<MapUI> createState() => _MapUIState();
}


class _MapUIState extends State<MapUI> {
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
      crossAxisAlignment: CrossAxisAlignment.center,
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
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 0 ,horizontal: 80),
          alignment: Alignment.center,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              ListTile(
                leading: Image.asset('assets/images/chat_images/emoji1.png'),
                title: Text('Purindu Thamash'),
              ),
              ListTile(
                leading: Image.asset('assets/images/chat_images/emoji1.png'),
                title: Text('Sithum Raveesha'),
              ),
              ListTile(
                leading: Image.asset('assets/images/chat_images/emoji1.png'),
                title: Text('Ginura Ransika'),
              ),
            ],
          ),
        ),
      ],
        ),
    );
  }
}
