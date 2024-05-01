import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class MainController extends GetxController {
  late PersistentTabController bottomController;

  @override
  void onInit() {
    bottomController = PersistentTabController(initialIndex: 0);
    super.onInit();
  }
}
