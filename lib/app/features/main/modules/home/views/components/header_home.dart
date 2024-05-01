import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../config/constant/app_constant.dart';
import '../../../../../../shared/widgets/app_widgets.dart';

class HeaderHome extends StatelessWidget {
  final Function() onTappedProfile;
  const HeaderHome({
    super.key,
    required this.onTappedProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 115,
      padding: const EdgeInsets.only(top: 55, left: 16, right: 16),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 170,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  KdAssetsImagesPath.logosText,
                ),
              ),
            ),
          ),
          // Spacer(),
          const SizedBox(width: 50),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 10),
                  const Icon(Icons.search, size: 24),
                  KdPictureWidget(
                    imageUrl: 'https://source.unsplash.com/user/wsanter',
                    size: 24,
                    radius: 6,
                    onTapped: onTappedProfile,
                  ),
                  const Icon(Icons.notifications_none_outlined),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
