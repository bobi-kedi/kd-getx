import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../shared/styles/app_styles.dart';
import '../../../../shared/widgets/app_widgets.dart';
import '../../../../utils/helper/app_helper.dart';
import '../controllers/change_language_controller.dart';

class ChangeLanguageView extends GetView<ChangeLanguageController> {
  const ChangeLanguageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('sign_in'.tr),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Text(
                  'select_language'.tr,
                  style: KdTextStyles.heading4Bold.copyWith(
                    color: KdColors.primary70,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.setLanguage(languages: controller.languages.first);
                },
                child: KdCardItemWidget(
                  image: controller.languages.first.imageFlag,
                  title: controller.languages.first.languageName,
                  selectedIndex: (controller.selectedIndex.value ==
                      controller.languages.first.id),
                ),
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  controller.setLanguage(languages: controller.languages.last);
                },
                child: KdCardItemWidget(
                  image: controller.languages.last.imageFlag,
                  title: controller.languages.last.languageName,
                  selectedIndex: (controller.selectedIndex.value ==
                      controller.languages.last.id),
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: 250,
                child: KdButtonWidget(
                  text: 'OK',
                  buttonSizeType: ButtonSizeType.large,
                  onTapped: () {
                    controller.navigationNext();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
