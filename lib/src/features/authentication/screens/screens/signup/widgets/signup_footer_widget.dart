import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:kcroz/src/features/authentication/screens/screens/login/login_screen.dart';
import 'package:provider/provider.dart';

import '../../../../../../constants/image_string.dart';
import '../../../../../../constants/text_string.dart';
import '../../../../../../services/firebase_auth_methods.dart';


class SignUpFooterWidget extends StatelessWidget {
  const SignUpFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("OR"),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {
              context.read<FirebaseAuthMethods>().signInWithGoogle(context);
            },
            icon: const Image(image: AssetImage(kcrozGoogleLogoImage), width: 20.0,),
            label: Text(kcrozSignInWithGoogle.toUpperCase()),

          ),
        ),
        TextButton(
            onPressed: () {Get.to(() => const LoginScreen());},
            child: Text.rich(
                TextSpan(
                    children: [
                      TextSpan(
                          text: kcrozAlreadyHavenAccount,
                          style: Theme.of(context).textTheme.bodyText1
                      ),
                      TextSpan(text: " ${kcrozLogin.toUpperCase()}",),
                    ]
                )
            ))
      ],
    );
  }
}