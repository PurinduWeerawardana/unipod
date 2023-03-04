import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../features/authentication/screens/screens/welcome/welcome_screen.dart';
import '../responsive/mobile_screen_layout.dart';
import '../responsive/responsive_layout_screen.dart';
import '../responsive/web_screen_layout.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          // Checking if the snapshot has any data or not
          if (snapshot.hasData) {
            // if snapshot has data which means user is logged in then we check the width of screen and accordingly display the screen layout
            return const ResponsiveLayout(
              mobileScreenLayout: MobileScreenLayout(),
              webScreenLayout: WebScreenLayout(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          }
        }

        // means connection to future hasn't been made yet
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return const WelcomeScreen();
      },
    );
  }
}