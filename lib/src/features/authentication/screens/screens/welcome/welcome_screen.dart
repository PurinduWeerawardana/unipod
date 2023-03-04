import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kcroz/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:kcroz/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:kcroz/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:kcroz/src/constants/colors.dart';
import 'package:kcroz/src/constants/sizes.dart';
import 'package:kcroz/src/constants/text_string.dart';
import '../../../../../constants/image_string.dart';
import '../login/login_screen.dart';
import '../signup/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startAnimation();

    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    // to use primary color as our background color in light mode
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark; // boolean


    return Scaffold(
      backgroundColor: isDarkMode ? kcrozSecondaryColor : kcrozPrimaryColor,
      body: Stack(
        children: [
          KcrozFadeInAnimation(
            durationInMs: 1200,
            animatePosition: KcrozAnimatePosition(
              bottomAfter: 0,
              bottomBefore: -100,
              leftBefore: 0,
              leftAfter: 0,
              topAfter: 0,
              topBefore: 0,
              rightAfter: 0,
              rightBefore: 0,
            ),
            child: Container(
              padding: const EdgeInsets.all(kcrozDefaultSize),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Hero(
                      tag: "welcome-image-tag",
                      child: Image(
                        image: const AssetImage(kcrozWelcomeScreenImage),
                        height: height * 0.6,
                      )
                  ),
                  Column(
                    children: [
                      Text(
                        kcrozWelcomeTitle,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        kcrozWelcomeSubTitle,
                        style: Theme.of(context).textTheme.bodyText1,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: OutlinedButton(
                              onPressed: () {Get.to(() => const LoginScreen());},
                              child: Text(kcrozLogin.toUpperCase())
                          )
                      ),
                      const SizedBox(width: 10.0,),
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                Get.to(() => const SignUpScreen());},
                              child: Text(kcrozSignup.toUpperCase())
                          )
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
