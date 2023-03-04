import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kcroz/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:kcroz/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';

import '../../../../../common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/image_string.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_string.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startSplashAnimation();

    return Scaffold(
      body: Stack(
        children: [

          KcrozFadeInAnimation(
            durationInMs: 1600, 
            animatePosition: KcrozAnimatePosition(
                topAfter: 0, topBefore: -30, leftAfter : 0,leftBefore : -30
            ),
            child: const Image(image: AssetImage(kcrozSplashTopIcon)),
          ),

          // observer will observe below element
          KcrozFadeInAnimation(
            durationInMs: 2000,
            animatePosition: KcrozAnimatePosition(topBefore: 80, topAfter: 80, leftAfter: kcrozDefaultSize, leftBefore: -80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  kcrozAppName,
                  style: Theme.of(context).textTheme.headline3,
                ),
                Text(
                  kcrozAppTagLine,
                  style: Theme.of(context).textTheme.headline2,
                ),
              ],
            ),
          ),

          KcrozFadeInAnimation(
            durationInMs: 2400,
            animatePosition: KcrozAnimatePosition(bottomBefore: 0, bottomAfter: 100),
            child: const Image(image: AssetImage(kcrozSplashBottomIcon)),
          ),

          KcrozFadeInAnimation(
            durationInMs: 2400,
            animatePosition: KcrozAnimatePosition(bottomBefore: 0, bottomAfter: 60, rightBefore: kcrozDefaultSize, rightAfter: kcrozDefaultSize),
            child: Container(
              width: kcrozSplashContainerSize,
              height: kcrozSplashContainerSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: kcrozPrimaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
