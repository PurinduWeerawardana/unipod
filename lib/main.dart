import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:provider/provider.dart';
import 'package:unipod/src/features/authentication/screens/screens/splash_screen/splash_screen.dart';
import 'package:unipod/src/providers/user_provider.dart';
import 'package:unipod/src/services/firebase_auth_methods.dart';
import 'package:unipod/src/utils/theme/theme.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "AIzaSyCT6gukdku4kHO18alUDoUce6Skur9oO8U",
          appId: "1:1027941086185:web:23c79fa588e1ae1ff1d178",
          messagingSenderId: "1027941086185",
          projectId: "kcroz-dating-app",
          storageBucket: "kcroz-dating-app.appspot.com",
        )
    );
  } else {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform
    );
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider(),),
        Provider<FirebaseAuthMethods>(create: (_) => FirebaseAuthMethods(),),

      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: KcrozAppTheme.lightTheme,
        darkTheme: KcrozAppTheme.darkTheme,
        defaultTransition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
        home: const SplashScreen(),
        // routes: const {},
      ),
    );
  }
}


