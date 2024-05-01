import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelasdigital/app/data/datasource/local/local_datasource.dart';

import '../../../../../config/routes/app_pages.dart';

class HomeController extends GetxController {
  RxBool isDarkMode = false.obs;
  RxBool isEnglsihVersion = false.obs;
  final LocalDatasource localDatasource = LocalDatasource();

  void toggleDarkMode() {
    isDarkMode.value = !isDarkMode.value;
    if (isDarkMode.value) {
      Get.changeTheme(ThemeData.dark());
    } else {
      Get.changeTheme(ThemeData.light());
    }
  }

  void clearLocalStorage() async {
    localDatasource.clearToken();
    await Future.delayed(const Duration(seconds: 2), () {
      Get.offNamedUntil(Routes.LOGIN, (route) => false);
    });
  }

  void goToProfile() async {
    Get.toNamed(Routes.PROFILE);
  }
}
