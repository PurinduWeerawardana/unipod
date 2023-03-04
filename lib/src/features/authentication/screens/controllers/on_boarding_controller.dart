import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/image_string.dart';
import '../../../../constants/text_string.dart';
import '../models/model_on_boarding.dart';
import '../screens/on_boarding/on_boarding_page_widget.dart';
import '../screens/welcome/welcome_screen.dart';

class OnBoardingController extends GetxController{

  final controller = LiquidController();
  RxInt currentPage = 0.obs;

  final pages = [
    OnBoardingPageWidget(
        model: OnBoardingModel(
          image: kcrozOnBoardingImage1,
          title: kcrozOnBoardingTitle1,
          subTitle: kcrozOnBoardingSubTitle1,
          counterText: kcrozOnBoardingCounter1,
          bgColor: kcrozOnBoardingPage1Color,
      )
    ),
    OnBoardingPageWidget(
        model: OnBoardingModel(
          image: kcrozOnBoardingImage2,
          title: kcrozOnBoardingTitle2,
          subTitle: kcrozOnBoardingSubTitle2,
          counterText: kcrozOnBoardingCounter2,
          bgColor: kcrozOnBoardingPage2Color,
      )
    ),
    OnBoardingPageWidget(
        model: OnBoardingModel(
          image: kcrozOnBoardingImage3,
          title: kcrozOnBoardingTitle3,
          subTitle: kcrozOnBoardingSubTitle3,
          counterText: kcrozOnBoardingCounter3,
          bgColor: kcrozOnBoardingPage3Color,
      ),
    ),
  ];



  skip() async {
    await Get.to(const WelcomeScreen());
  }

  animateToNextSlide() async {
    int nextPage = controller.currentPage + 1;
    if(controller.currentPage == 2) {
      await Get.to(const WelcomeScreen());
    } else {
      controller.animateToPage(page: nextPage);
    }
  }
  onPageChangedCallback(int activePageIndex) {
    currentPage.value = activePageIndex;
  }
}
