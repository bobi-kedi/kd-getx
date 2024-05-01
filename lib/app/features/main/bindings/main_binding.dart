import 'package:get/get.dart';

import '../controllers/main_controller.dart';
import '../modules/conversation/controllers/conversation_controller.dart';
import '../modules/home/controllers/home_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ConversationController>(() => ConversationController());
  }
}
