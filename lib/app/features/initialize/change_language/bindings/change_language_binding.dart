import 'package:get/get.dart';
import 'package:kelasdigital/app/features/auth/controller/auth_controller.dart';

import '../controllers/change_language_controller.dart';

class ChangeLanguageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangeLanguageController>(
      () => ChangeLanguageController(),
    );
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
  }
}
