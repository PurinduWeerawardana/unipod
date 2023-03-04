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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children:[
          SizedBox.fromSize(size: Size(100, 100)),
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.network(
                  'https://blogger.googleusercontent.com/img/a/AVvXsEjA3yU3DQvoZfKBHzkcIumfUyxaUYDVVWSQcu5ikh8PW_UQx_wxTNivemQn1MY1TsjvFVDesueMPmTk-FWnYErepqHjvi9Ni4hSTvhlNfFIBsOLYjCnfq4sxeTkVNPjm7GApYXQSRd3Bwe7I06FqWu8Ja2W7VM7nsJf-ZwO59ckAJvjD2_cI0TjEwVE=s895',
                  fit:BoxFit.fitHeight,
                  height: 150,
                ),
          ),

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextButton(key:null,
                          onPressed: () {  },
                          child:
                          const Text(
                            "Text Button 1",
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
                            "Text Button 2",
                            style: TextStyle(fontSize:12.0,
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.w200,
                                fontFamily: "Roboto"),
                          )
                      )
                    ]

                ),

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextButton(key:null,
                          onPressed: () {  },
                          child:
                          const Text(
                            "Text Button 3",
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

                      TextButton(key:null,
                          onPressed: () {  },
                          child:
                          const Text(
                            "Text Button 5",
                            style: TextStyle(fontSize:12.0,
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.w200,
                                fontFamily: "Roboto"),
                          )
                      )
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
