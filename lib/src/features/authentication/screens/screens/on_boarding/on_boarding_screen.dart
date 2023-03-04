import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../constants/colors.dart';
import '../../controllers/on_boarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final onboardController = OnBoardingController();
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            liquidController: onboardController.controller,
            pages: onboardController.pages,
            enableSideReveal: true,
            onPageChangeCallback: onboardController.onPageChangedCallback,
            slideIconWidget: const Icon(Icons.arrow_back_ios),
          ),
          Positioned(
            bottom: 60.0,
            child: OutlinedButton(
              onPressed: () => onboardController.animateToNextSlide(),
              style: ElevatedButton.styleFrom(
                side: const BorderSide(color: Colors.black26),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20),
                foregroundColor: Colors.white,
              ),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  color: kcrozDarkColor, shape: BoxShape.circle
                ),
                child: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          Positioned(
              top: 50,
              right: 20,
              child: TextButton(
                // skip property
                onPressed: () => onboardController.skip(),
                child: const Text("Skip", style: TextStyle(color: Colors.grey),)
              )
             ),
          Obx(() => Positioned(
              bottom: 30,
              child: AnimatedSmoothIndicator(
                activeIndex: onboardController.currentPage.value,
                count: 3,
                effect: const WormEffect(
                  activeDotColor: Color(0xff272727),
                  dotHeight: 5.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


}


