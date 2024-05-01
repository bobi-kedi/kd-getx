import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../config/constant/app_constant.dart';
import '../../../../../shared/styles/app_styles.dart';
import '../../../../../shared/widgets/app_widgets.dart';
import '../controllers/register_role_controller.dart';

class RegisterRoleView extends GetView<RegisterRoleController> {
  const RegisterRoleView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instansi',
          style: KdTextStyles.heading5SemiBold
              .copyWith(fontWeight: FontWeight.w600),
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            margin: const EdgeInsets.only(left: 16),
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: KdColors.primary10,
            ),
            child: Center(
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: KdColors.primary70,
                size: 20,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 30, top: 80),
            child: Text(
              'Silakan Pilih Akun Anda',
              style: KdTextStyles.heading5SemiBold.copyWith(
                color: KdColors.neutral90,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.navigationNext(role: 'lecture');
            },
            child: KdCardItemWidget(
              image: KdAssetsImagesPath.registerLecture,
              title: 'Dosen',
            ),
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              controller.navigationNext(role: 'student');
            },
            child: KdCardItemWidget(
              image: KdAssetsImagesPath.registerGraduate,
              title: 'Mahasiswa',
              color: const Color(0xffEB8C10),
            ),
          ),
        ],
      ),
    );
  }
}
