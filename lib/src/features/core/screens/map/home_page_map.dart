import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kcroz/src/constants/text_string.dart';
import 'package:kcroz/src/services/firebase_auth_methods.dart';
import 'package:provider/provider.dart';

import '../../../../common_widgets/button/custom_button.dart';

class HomePageMap extends StatefulWidget {
  const HomePageMap({Key? key}) : super(key: key);

  @override
  State<HomePageMap> createState() => _HomePageMapState();
}

class _HomePageMapState extends State<HomePageMap> {
  String  username = "";

  @override
  void initState() {
    super.initState();
    getUsername();
  }

  void getUsername() async {
    // snapshot of the current user's data from the firebase firestore database
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    print(snapshot.data());
    setState(() {
      username = (snapshot.data() as Map<String, dynamic>)['username'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu, color: Colors.black,),
        title: Text(kcrozAppName, style: Theme.of(context).textTheme.headline4,),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey,
            ),
            child: IconButton(
              onPressed: () {
                FirebaseAuthMethods().signOut(context);
                },
              icon: const Icon(Icons.logout_outlined),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(username),
              CustomButton(
                onTap: () {
                  context.read<FirebaseAuthMethods>().signOut(context);
                },
                text: 'Sign Out',
              ),
              CustomButton(
                onTap: () {
                  context.read<FirebaseAuthMethods>().deleteAccount(context);
                },
                text: 'Delete Account',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
