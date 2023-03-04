
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:kcroz/src/features/authentication/screens/screens/welcome/welcome_screen.dart';
import 'package:kcroz/src/responsive/mobile_screen_layout.dart';
import 'package:kcroz/src/responsive/responsive_layout_screen.dart';
import 'package:kcroz/src/responsive/web_screen_layout.dart';
import 'package:provider/provider.dart';


class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return const ResponsiveLayout(
          webScreenLayout: WebScreenLayout(),
          mobileScreenLayout: MobileScreenLayout());
    }
    return const WelcomeScreen();
  }
}

