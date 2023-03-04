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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      IconButton(key:null,
                          onPressed: () {  },
                          icon: Icon(LineAwesomeIcons.info_circle),
                          color: Color(0xFF8BB9FD),
                          ),
                      TextButton(key:null,
                          onPressed: () {  },
                          style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Color(0xFF8BB9FD)),
                            )
                          )
                          ),
                          child:
                          const Text(
                            "Connect",
                            style: TextStyle(fontSize:12.0,
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.w200,
                                fontFamily: "Roboto"),
                          )
                      ),
                      TextButton(key:null,
                          onPressed: () {  },
                          child:
                          const Text(
                            "Text Button 4",
                            style: TextStyle(fontSize:12.0,
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.w200,
                                fontFamily: "Roboto"),
                          )
                      ),
                    ]

                ),

                const Text(
                  "qWerty1",
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
