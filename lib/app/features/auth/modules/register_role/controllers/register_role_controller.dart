import 'package:get/get.dart';

import '../../../../../config/routes/app_pages.dart';

class RegisterRoleController extends GetxController {
  var dataArg = Get.arguments;

  void navigationNext({required String role}) {
    var data = {'type': dataArg.toString(), 'role': role};

    Get.toNamed(Routes.REGISTER_FORM, arguments: data);
  }
}
