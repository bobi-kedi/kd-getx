import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ChatroomController extends GetxController {
  var dataArg = Get.arguments;
  RxBool isGroup = false.obs;
  RxBool isEmptyText = true.obs;

  late TextEditingController inputC;
  late FocusNode focusNode;

  @override
  void onInit() {
    isGroup.value = dataArg as bool;
    inputC = TextEditingController();
    focusNode = FocusNode(
      onKey: (FocusNode node, RawKeyEvent evt) {
        if (!evt.isShiftPressed && evt.logicalKey.keyLabel == 'Enter') {
          if (evt is RawKeyDownEvent) {
            sendMessage();
          }
          return KeyEventResult.handled;
        } else {
          return KeyEventResult.ignored;
        }
      },
    );
    super.onInit();
  }

  void sendMessage() {
    String textMessage = inputC.text.trim();
    if (textMessage.isNotEmpty) {
      debugPrint('SEND MESSAGE : $textMessage');
      Future.delayed(Duration.zero, () {
        focusNode.requestFocus();
        isEmptyText.value = true;
        inputC.clear();
      });
    }
  }

  @override
  void onClose() {
    inputC.dispose();
    focusNode.dispose();
    super.onClose();
  }
}
