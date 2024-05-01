import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../../config/constant/app_constant.dart';
import '../../../../shared/widgets/app_widgets.dart';
import '../../../../utils/helper/app_helper.dart';
import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 67,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(KdAssetsImagesPath.logosText),
                ),
              ),
            ),
            const SizedBox(height: 90),
            SizedBox(
              width: 250,
              child: KdButtonWidget(
                text: 'Masuk',
                buttonSizeType: ButtonSizeType.large,
                onTapped: () {
                  controller.goToLogin();
                },
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 250,
              child: KdButtonWidget(
                text: 'Daftar',
                buttonSizeType: ButtonSizeType.large,
                buttonType: ButtonType.secondary,
                onTapped: () {
                  controller.goToRegister();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
