import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../shared/styles/app_styles.dart';
import '../../../../../shared/widgets/app_widgets.dart';
import '../../../../../utils/helper/app_helper.dart';
import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(
        //   'Lupa Kata Sandi',
        //   style: KdTextStyles.heading5SemiBold.copyWith(fontWeight: FontWeight.w600),
        // ),
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
      body: Stack(
        children: [
          Obx(
            () => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 30, top: 80, left: 16, right: 16),
                  child: Text(
                    'Setel Ulang Kata Sandi',
                    style: KdTextStyles.heading5SemiBold.copyWith(
                      color: KdColors.primary70,
                    ),
                  ),
                ),
                KdFormInputWidget(
                  label: 'Kata Sandi',
                  hintText: '● ● ● ● ● ● ● ●',
                  formInputType: FormInputType.password,
                  obscureText: !controller.showPassword.value,
                  onSaved: (value) {},
                  onShowPassword: () => controller.showPassword.toggle(),
                ),
                KdFormInputWidget(
                  label: 'Ulangi Kata Sandi',
                  hintText: '● ● ● ● ● ● ● ●',
                  formInputType: FormInputType.password,
                  obscureText: !controller.showRetypePassword.value,
                  onSaved: (value) {},
                  onShowPassword: () => controller.showRetypePassword.toggle(),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              color: Colors.white,
              child: SizedBox(
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: KdButtonWidget(
                    text: 'Perbaharui Kata Sandi',
                    buttonSizeType: ButtonSizeType.large,
                    onTapped: () {
                      controller.sendResetPassword(context: context);
                    },
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
