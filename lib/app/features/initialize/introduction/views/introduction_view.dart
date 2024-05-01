import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../../config/constant/app_constant.dart';
import '../../../../shared/styles/app_styles.dart';
import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  const IntroductionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            titleWidget: Text(
              'LEARNING',
              style: KdTextStyles.heading5SemiBold.copyWith(
                color: KdColors.primary70,
              ),
            ),
            bodyWidget: Text(
              "onboard1".tr,
              style: KdTextStyles.body1Regular.copyWith(
                color: KdColors.neutral70,
              ),
              textAlign: TextAlign.center,
            ),
            image: SizedBox(
              width: Get.width * 0.8,
              height: Get.width * 0.8,
              child: Center(
                child: Image.asset(KdAssetsImagesPath.onboards1),
              ),
            ),
            decoration: const PageDecoration(
              imageFlex: 2,
            ),
          ),
          PageViewModel(
            titleWidget: Text(
              'SHARING',
              style: KdTextStyles.heading5SemiBold.copyWith(
                color: KdColors.primary70,
              ),
            ),
            bodyWidget: Text(
              "onboard2".tr,
              style: KdTextStyles.body1Regular.copyWith(
                color: KdColors.neutral70,
              ),
              textAlign: TextAlign.center,
            ),
            image: SizedBox(
              width: Get.width * 0.8,
              height: Get.width * 0.8,
              child: Center(
                child: Image.asset(KdAssetsImagesPath.onboards2),
              ),
            ),
            decoration: const PageDecoration(
              imageFlex: 2,
            ),
          ),
          PageViewModel(
            titleWidget: Text(
              'COLLABORATE',
              style: KdTextStyles.heading5SemiBold.copyWith(
                color: KdColors.primary70,
              ),
            ),
            bodyWidget: Text(
              "onboard3".tr,
              style: KdTextStyles.body1Regular.copyWith(
                color: KdColors.neutral70,
              ),
              textAlign: TextAlign.center,
            ),
            image: SizedBox(
              width: Get.width * 0.8,
              height: Get.width * 0.8,
              child: Center(
                child: Image.asset(KdAssetsImagesPath.onboards3),
              ),
            ),
            decoration: const PageDecoration(
              imageFlex: 2,
            ),
          ),
        ],
        showSkipButton: true,
        skip: Text(
          "Lewati",
          style: KdTextStyles.button2Regular.copyWith(
            color: KdColors.primary70,
          ),
        ),
        next: Text(
          "Lanjut",
          style: KdTextStyles.button2Regular.copyWith(
            color: KdColors.primary70,
          ),
        ),
        done: Text(
          "Lanjut",
          style: KdTextStyles.button2Regular.copyWith(
            color: KdColors.primary70,
          ),
        ),
        onDone: () {
          controller.goToWelcome();
        },
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(17.0, 10.0),
          activeColor: KdColors.primary90,
          color: KdColors.primary30,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        ),
      ),
    );
  }
}
