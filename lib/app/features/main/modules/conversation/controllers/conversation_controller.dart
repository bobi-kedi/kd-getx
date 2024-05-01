import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelasdigital/app/config/routes/app_pages.dart';
import 'package:kelasdigital/app/data/datasource/network/firebase_remote_datasource.dart';

class ConversationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxString title = 'Conversation Title'.obs;
  late TabController tabController;

  RxInt tabIndex = 0.obs;

  RxList dataConversation = [].obs;

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: 2, initialIndex: 0);

    tabController.addListener(() {
      tabIndex.value = tabController.index;
    });

    getConversation();
    super.onInit();
  }

  void goToChat({bool isGroup = false}) {
    Get.toNamed(Routes.CHATROOM, arguments: isGroup);
  }

  getConversation() {
    try {
      FirebaseRemoteDatasource.getAllRooms().listen((event) {
        dataConversation.value = [];
        for (var room in event.docs) {
          final Map<String, dynamic> data = room.data();
          dataConversation.add(data);
          debugPrint('DATA : $data');
        }
      });
    } catch (e) {
      debugPrint('ERROR GETCONVERSATION : $e');
    }
  }
}
