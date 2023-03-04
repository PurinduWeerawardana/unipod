import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kcroz/src/services/firebase_auth_methods.dart';
import '../../../../../../constants/image_string.dart';
import '../../../../../../constants/sizes.dart';
import '../../../../../../constants/text_string.dart';
import '../../signup/signup_screen.dart';


class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        const SizedBox(height: kcrozFormHeight - 20,),
        SizedBox( // make it cover the complete screen
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: const Image(image: AssetImage(kcrozGoogleLogoImage), width: 20.0,),
            onPressed: () {
              FirebaseAuthMethods().signInWithGoogle(context);
            },
            label: Text(kcrozSignInWithGoogle.toUpperCase()),
          ),
        ),
        const SizedBox(height: kcrozFormHeight - 20,),
        TextButton(
            onPressed: () {Get.to(() => const SignUpScreen());},
            child: Text.rich(TextSpan(
                text: dontHaveAnAccount,
                style: Theme.of(context).textTheme.bodyText1,
                children: const [
                  TextSpan(
                    text: " $kcrozSignup",
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold
                    ),
                  )
                ]
            ))
        )
      ],
    );
  }
}