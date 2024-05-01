import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chatroom_controller.dart';
import 'components/footer_chatroom.dart';
import 'components/header_chatroom_group.dart';
import 'components/header_chatroom_private.dart';
import 'components/kd_message/kd_message.dart';

class ChatroomView extends GetView<ChatroomController> {
  const ChatroomView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Obx(
            () => (controller.isGroup.value)
                ? const HeaderChatroomGroup(
                    title: 'Pendidikan Pancasila',
                    description: '300 Members, 12 Online',
                  )
                : const HeaderChatroomPrivate(
                    isFriend: true,
                  ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              reverse: true,
              children: const [
                KdFileMessage(
                  message: 'File Message here',
                  messageAt: '08:59',
                ),
                KdFileMessage(
                  message: 'File Message here',
                  messageAt: '08:59',
                  isMe: true,
                ),
                KdImageMessage(
                  message: 'Image Message here',
                  messageAt: '08:59',
                  isMe: true,
                ),
                KdImageMessage(
                  message: 'Image Message here',
                  messageAt: '08:59',
                ),
                KdCustomMessage(
                  message: 'Custom Message here',
                  messageAt: '08:59',
                ),
                KdCustomMessage(
                  message: 'Custom Message here',
                  messageAt: '08:59',
                  isMe: true,
                ),
                KdTextMessage(
                  message:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In quis aliquet mi. Maecenas id tortor sodales, vehicula nisi non, molestie nisi. Maecenas lobortis justo et mi scelerisque interdum.',
                  messageAt: '09:10',
                  isMe: true,
                ),
                KdTextMessage(
                  message:
                      'Nulla est ex, tempor nec erat quis, consequat finibus',
                  messageAt: '09:05',
                ),
                KdTextMessage(
                  message:
                      'Nulla est ex, tempor nec erat quis, consequat finibus\n\n\nDonec laoreet semper dolor, ac mollis arcu dapibus in. Maecenas tristique semper ligula, nec scelerisque sapien faucibus',
                  messageAt: '09:00',
                ),
                KdTextMessage(
                  message: 'Kelas Digital',
                  messageAt: '08:59',
                  isMe: true,
                ),
                KdSystemMessage(
                  isSession: true,
                ),
                KdSystemMessage(),
              ],
            ),
          ),
          Obx(
            () => FooterChatroom(
              controller: controller.inputC,
              isEmptyText: (controller.isEmptyText.value),
              focusNode: controller.focusNode,
              onChanged: (value) {
                controller.isEmptyText.value = (value.isEmpty);
              },
              onSendTapped: () {
                if (controller.inputC.text.trim().isNotEmpty) {
                  controller.sendMessage();
                }
              },
              onAudioTapped: () {
                if (controller.inputC.text.trim().isEmpty) {
                  debugPrint('AUDIO TAP');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
