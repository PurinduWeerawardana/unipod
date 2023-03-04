import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../constants/text_string.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children:[
          SizedBox.fromSize(size: Size(0,50)),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),//or 15.0
            child: Container(
              height: 150.0,
              width: 150.0,
              color: Color(0xffFF0E58),
              child: Image.network(
                'https://blogger.googleusercontent.com/img/a/AVvXsEjA3yU3DQvoZfKBHzkcIumfUyxaUYDVVWSQcu5ikh8PW_UQx_wxTNivemQn1MY1TsjvFVDesueMPmTk-FWnYErepqHjvi9Ni4hSTvhlNfFIBsOLYjCnfq4sxeTkVNPjm7GApYXQSRd3Bwe7I06FqWu8Ja2W7VM7nsJf-ZwO59ckAJvjD2_cI0TjEwVE=s895',
              fit: BoxFit.cover,
              ),
            ),
          ),
                SizedBox.fromSize(size: Size(10, 10)),
                const Text(
                  "Anne Marie",
                  style: TextStyle(
                      fontSize:16.0,
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.w400,
                      fontFamily: "Poppins"),
                ),

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              TextButton(key:null,
                                  onPressed: () {  },
                                  child:
                                  const Text(
                                    "15\nConnections",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize:15.0,
                                        color: Color(0xFF717171),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Poppins"),
                                  )
                              ),
                              const VerticalDivider(
                                color: Color(0xFF949494),
                                thickness: 1,
                                indent: 12,
                                endIndent: 10,
                              ),
                              TextButton(key:null,
                                  onPressed: () {  },
                                  child:
                                  const Text(
                                    "15%\nMatching",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize:15.0,
                                        color: Color(0xFF717171),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Poppins"),
                                  )
                              ),
                            ],
                          )),
                    ]

                ),

                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      IconButton(key:null,
                          onPressed: () {  },
                          icon: const Icon(LineAwesomeIcons.user_circle, size: 30,),
                          color: const Color(0xFF8BB9FD),
                          ),
                      TextButton(key:null,
                          onPressed: () {  },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF8BB9FD)),
                            padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(horizontal: 30.0)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: const BorderSide(color: Color(0xFF8BB9FD)),
                            )
                          )
                          ),
                          child:
                          const Text(
                            "Connect",
                            style: TextStyle(
                              letterSpacing: 1.5,
                                fontSize:15.0,
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w400,
                                fontFamily: "Poppins"
                            ),
                          )
                      ),
                      IconButton(key:null,
                        onPressed: () {  },
                        icon: const Icon(LineAwesomeIcons.laugh_face_with_beaming_eyes, size: 30,),
                        color: const Color(0xFF8BB9FD),
                      ),
                    ]

                ),

                const Text(
                  "100% Italian, fun loving, affectionate young lady who knows what it takes to mako a rolationshio work.",
                  style: TextStyle(fontSize:12.0,
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto"),
                )

        ]
      )
    );
  }
}
