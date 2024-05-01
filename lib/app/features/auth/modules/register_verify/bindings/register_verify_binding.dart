import 'package:get/get.dart';

import '../controllers/register_verify_controller.dart';

class RegisterVerifyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterVerifyController>(
      () => RegisterVerifyController(),
    );
  }
}
