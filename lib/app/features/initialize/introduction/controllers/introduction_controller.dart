import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelasdigital/app/data/datasource/local/local_datasource.dart';

import '../../../../config/routes/app_pages.dart';
import '../../../auth/controller/auth_controller.dart';

class IntroductionController extends GetxController {
  final authC = Get.find<AuthController>();
  final LocalDatasource localDatasource = LocalDatasource();

  void goToWelcome() {
    try {
      localDatasource.saveSkipOnboard();
      Get.offNamed(Routes.WELCOME);
    } catch (e) {
      debugPrint('ERROR goToWelcome $e');
    }
  }
}
