import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../data/datasource/network/firebase_remote_datasource.dart';
import '../../../../../shared/styles/app_styles.dart';
import '../controllers/conversation_controller.dart';
import 'components/card_item_chat.dart';
import 'components/card_item_classroom.dart';
import 'components/header_conversation.dart';
import 'components/skeleton_conversation.dart';
import 'components/tab_bar_conversation.dart';

class ConversationView extends GetView<ConversationController> {
  const ConversationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const HeaderConversation(),
          const SizedBox(height: 12),
          Obx(
            () => TabBar(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              splashFactory: NoSplash.splashFactory,
              dividerColor: Colors.white,
              indicatorColor: Colors.transparent,
              unselectedLabelColor: KdColors.neutral50,
              unselectedLabelStyle: KdTextStyles.button2Medium.copyWith(
                color: KdColors.neutral50,
              ),
              labelStyle: KdTextStyles.button2Medium.copyWith(
                color: KdColors.primary90,
              ),
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: KdColors.primary30,
              ),
              tabs: [
                TabBarConversation(
                  text: 'Kelas Aktif',
                  selectedTab: controller.tabIndex.value == 0,
                ),
                TabBarConversation(
                  text: 'Chat',
                  selectedTab: controller.tabIndex.value == 1,
                  unRead: 7,
                ),
              ],
              controller: controller.tabController,
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller.tabController,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CardItemClassroom(
                          lectureName: 'Cindi Astria',
                          classroomName: 'Pendidikan Pancasila',
                          isCreator: true,
                          description: 'PP192052  |  2 SKS  |  Senin 08:00',
                          onTapped: () {
                            controller.goToChat(isGroup: true);
                          },
                        ),
                        CardItemClassroom(
                          lectureName: 'Yanti Sulistiowati',
                          classroomName: 'Administrasi Perkantoran',
                          onTapped: () {
                            controller.goToChat(isGroup: true);
                          },
                        ),
                        const SkeletonConversation(count: 2),
                      ],
                    ),
                  ),
                ),
                StreamBuilder(
                  stream: FirebaseRemoteDatasource.getAllRooms(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                      case ConnectionState.none:
                        return Center(
                          child: CircularProgressIndicator(
                            color: Colors.blue.withOpacity(.5),
                          ),
                        );
                      case ConnectionState.active:
                      case ConnectionState.done:
                        final data = snapshot.data?.docs;
                        List listData =
                            data?.map((e) => e.data()).toList() ?? [];
                        if (listData.isNotEmpty) {
                          return ListView.builder(
                            itemCount: controller.dataConversation.length,
                            itemBuilder: (context, index) {
                              var data = controller.dataConversation[index];
                              return CardItemChat(
                                name: data['uid'],
                                lastMessage: data['lastMessage']['message'],
                                lastMessageAt: data['lastMessage']['messageId'],
                                isGroup: true,
                                onTapped: () {
                                  // controller.goToChat(isGroup: true);
                                },
                              );
                            },
                          );
                        } else {
                          return const Center(
                            child: Text(
                              'No Data Found',
                              style: TextStyle(fontSize: 20),
                            ),
                          );
                        }
                    }
                  },
                ),
                // Obx(
                //   () => ListView.builder(
                //     itemCount: controller.dataConversation.length,
                //     itemBuilder: (context, index) {
                //       var data = controller.dataConversation[index];
                //       return CardItemChat(
                //         name: data['uid'],
                //         lastMessage: data['lastMessage']['message'],
                //         lastMessageAt: data['lastMessage']['messageId'],
                //         isGroup: true,
                //         onTapped: () {
                //           // controller.goToChat(isGroup: true);
                //         },
                //       );
                //       // Padding(
                //       //   padding: const EdgeInsets.symmetric(horizontal: 16),
                //       //   child: SingleChildScrollView(
                //       //     child: Column(
                //       //       children: [
                //       //         CardItemChat(
                //       //           name: 'TIF 19KM',
                //       //           lastMessage:
                //       //               'Andini created the group "TIF 19KM"',
                //       //           lastMessageAt: '19.57',
                //       //           isGroup: true,
                //       //           onTapped: () {
                //       //             controller.goToChat(isGroup: true);
                //       //           },
                //       //         ),
                //       //         CardItemChat(
                //       //           name: 'Kelas Digital',
                //       //           isVerified: true,
                //       //           unRead: 1,
                //       //           isGroup: true,
                //       //           lastMessageAt: '13.00',
                //       //           lastMessage: 'Hi, kedis',
                //       //           onTapped: () {
                //       //             controller.goToChat();
                //       //           },
                //       //         ),
                //       //         CardItemChat(
                //       //           name: 'Andini Afriyanti',
                //       //           imageUrl:
                //       //               'https://source.unsplash.com/random/900x700/?woman',
                //       //           lastMessage:
                //       //               'Dilansir dari www.lipsum.com, “Lorem Ipsum Dolor Sit Amet” merupakan teks dummy atau contoh teks dalam dunia percetakan. Kalimat tersebut mulai populer dan dipakai pada tahun',
                //       //           lastMessageAt: '19.57',
                //       //           isMe: true,
                //       //           onTapped: () {
                //       //             controller.goToChat();
                //       //           },
                //       //         ),
                //       //         const SkeletonConversation(count: 2),
                //       //       ],
                //       //     ),
                //       //   ),
                //       // );
                //     },
                //   ),
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}
