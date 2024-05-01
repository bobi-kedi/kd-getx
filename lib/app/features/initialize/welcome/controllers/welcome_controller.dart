import 'package:get/get.dart';

import '../../../../config/routes/app_pages.dart';

class WelcomeController extends GetxController {
  void goToRegister() {
    Get.toNamed(Routes.REGISTER);
  }

  void goToLogin() {
    Get.toNamed(Routes.LOGIN);
  }
}
