import 'package:flutter/material.dart';
import 'package:gallery_image_viewer/gallery_image_viewer.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:unipod/src/services/firebase_auth_methods.dart';

import '../../../../constants/text_string.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final List<ImageProvider> _imageProviders = [
    Image.network(
            "https://i12.haber7.net//haber/haber7/og_image/2022/22/hande_ercelden_sert_cikis_kadinlara_yuklenmeyin_1654068467_3687.jpg")
        .image,
    Image.network(
            "https://los40es00.epimg.net/los40/imagenes/2021/08/11/cinetv/1628672548_463726_1628675121_noticia_normal_amp.jpg")
        .image,
    Image.network(
            "https://www.chafarderias.com/uploads/s1/17/08/69/hande-ercel.jpeg")
        .image,
    Image.network(
            "https://nubiapage.com/wp-content/uploads/cbfd5a971ff66f9e0439eaf447227aff-1-531x744.jpg")
        .image
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
          SizedBox.fromSize(size: Size(0, 50)),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0), //or 15.0
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
                fontSize: 16.0,
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
                    TextButton(
                        key: null,
                        onPressed: () {},
                        child: const Text(
                          "15\nConnections",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Color(0xFF717171),
                              fontWeight: FontWeight.w400,
                              fontFamily: "Poppins"),
                        )),
                    const VerticalDivider(
                      color: Color(0xFF949494),
                      thickness: 1,
                      indent: 12,
                      endIndent: 10,
                    ),
                    TextButton(
                        key: null,
                        onPressed: () {},
                        child: const Text(
                          "15%\nMatching",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Color(0xFF717171),
                              fontWeight: FontWeight.w400,
                              fontFamily: "Poppins"),
                        )),
                  ],
                )),
              ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  key: null,
                  onPressed: () {
                    FirebaseAuthMethods().deleteAccount(context);
                  },
                  icon: const Icon(
                    LineAwesomeIcons.user_circle,
                    size: 30,
                  ),
                  color: const Color(0xFF8BB9FD),
                ),
                TextButton(
                    key: null,
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFF8BB9FD)),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(horizontal: 30.0)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(color: Color(0xFF8BB9FD)),
                        ))),
                    child: const Text(
                      "Connect",
                      style: TextStyle(
                          letterSpacing: 1.5,
                          fontSize: 15.0,
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w400,
                          fontFamily: "Poppins"),
                    )),
                IconButton(
                  key: null,
                  onPressed: () {
                    FirebaseAuthMethods().signOut(context);
                  },
                  icon: const Icon(
                    LineAwesomeIcons.laugh_face_with_beaming_eyes,
                    size: 30,
                  ),
                  color: const Color(0xFF8BB9FD),
                ),
              ]),
          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              child: GalleryImageView(
                listImage: _imageProviders,
                imageDecoration:
                    BoxDecoration(border: Border.all(color: Colors.white)),
                boxFit: BoxFit.cover,
                galleryType: 3,
              ),
            ),
          ),
        ]));
  }
}
