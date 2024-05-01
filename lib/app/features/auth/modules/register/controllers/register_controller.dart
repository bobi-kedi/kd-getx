import 'package:get/get.dart';

import '../../../../../config/routes/app_pages.dart';

class RegisterController extends GetxController {
  void navigationNext({required String argument}) {
    if (argument.toLowerCase() == 'institute') {
      Get.toNamed(Routes.REGISTER_ROLE, arguments: argument);
    } else {
      var data = {'type': argument, 'role': argument};
      Get.toNamed(Routes.REGISTER_FORM, arguments: data);
    }
  }
}
