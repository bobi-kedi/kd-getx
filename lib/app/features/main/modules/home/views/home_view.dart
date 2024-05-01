import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../shared/widgets/app_widgets.dart';
import '../../../../../utils/helper/app_helper.dart';
import '../controllers/home_controller.dart';
import 'components/header_home.dart';
import 'components/user_story_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HeaderHome(
            onTappedProfile: () {
              debugPrint('Profile Clicked');
              controller.goToProfile();
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: SizedBox(
                      width: Get.width,
                      height: 120,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) => UserStoryHome(
                          index: index,
                          name: 'Nama Pengguna',
                          imageUrl:
                              'https://storage.googleapis.com/kedi_storage_dev/PROFILE_PICTURE/profile-picture_1679044544_9ygmy.png',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: Get.width,
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: KdButtonWidget(
                        text: 'Buat',
                        buttonSizeType: ButtonSizeType.large,
                        onTapped: () {},
                      ),
                    ),
                  ),
                  const KdFeedWidget(
                    name: 'STIH Adhyaksa',
                    isVerified: true,
                    isFriend: true,
                    imageUrl:
                        'https://storage.googleapis.com/kedi_storage_dev/PROFILE_PICTURE/profile-picture_1679044544_9ygmy.png',
                    listImageFeed: [
                      'https://storage.googleapis.com/kedi_storage_dev/PROFILE_PICTURE/profile-picture_1679044544_9ygmy.png'
                    ],
                  ),
                  const KdFeedWidget(
                    name: 'Adam David',
                    listImageFeed: ['https://source.unsplash.com/user/wsanter'],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
