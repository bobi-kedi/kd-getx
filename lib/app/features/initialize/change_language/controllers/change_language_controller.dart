import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/routes/app_pages.dart';
import '../../../../config/constant/app_constant.dart';
import '../../../../data/datasource/local/local_datasource.dart';
import '../../../../data/models/language_model.dart';
import '../../../auth/controller/auth_controller.dart';

class ChangeLanguageController extends GetxController {
  RxInt selectedIndex = 1.obs;
  RxString localeSelected = ''.obs;

  final authC = Get.find<AuthController>();
  final LocalDatasource localDatasource = LocalDatasource();

  RxList<LanguageModel> languages = [
    LanguageModel(
      id: 1,
      emojiFlag: "🇮🇩",
      languageName: 'Indonesia',
      locale: 'id',
      imageFlag: KdAssetsImagesPath.flagsIndonesia,
    ),
    LanguageModel(
      id: 2,
      emojiFlag: "🇺🇸",
      languageName: 'English',
      locale: 'en',
      imageFlag: KdAssetsImagesPath.flagsEnglish,
    ),
  ].obs;

  @override
  void onInit() {
    checkLocaleStorage();
    super.onInit();
  }

  void checkLocaleStorage() async {
    Locale? locale = authC.locale;
    selectedIndex.value = (locale!.languageCode == 'en') ? 2 : 1;
    update();
  }

  void setLanguage({required LanguageModel languages}) async {
    selectedIndex.value = languages.id;
    localeSelected.value = languages.locale;
    await setLanguageToLocalStorage().then((value) {
      var languageCode = languages.locale;
      Get.updateLocale(Locale(languageCode));
      update();
    });
  }

  Future<void> setLanguageToLocalStorage() async {
    localDatasource.saveLocale(localeSelected.value);
    debugPrint('BOX WRITE : ${localeSelected.value}');
  }

  void navigationNext() {
    Get.offNamed(Routes.INTRODUCTION);
  }
}
