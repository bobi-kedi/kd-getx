import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kelasdigital/app/utils/mixins/app_mixins.dart';

import '../../../../../config/constant/app_constant.dart';
import '../../../../../shared/styles/app_styles.dart';
import '../../../../../shared/widgets/app_widgets.dart';
import '../../../../../utils/helper/app_helper.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> with ValidatorMixin {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.loginFormKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80, bottom: 50),
                child: Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(KdAssetsImagesPath.logosIcon),
                    ),
                  ),
                ),
              ),
              // const SizedBox(height: 50),
              KdFormInputWidget(
                controller: controller.emailC,
                formInputType: FormInputType.email,
                label: 'Email',
                hintText: 'defaradithio@gmail.com',
                validator: validateEmailRequired,
                onSaved: (value) {},
              ),
              Obx(
                () => KdFormInputWidget(
                  controller: controller.passwordC,
                  label: 'Kata Sandi',
                  hintText: '● ● ● ● ● ● ● ●',
                  formInputType: FormInputType.password,
                  obscureText: !controller.showPassword.value,
                  onSaved: (value) {},
                  onShowPassword: () => controller.showPassword.toggle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => InkWell(
                        onTap: () {
                          controller.rememberMe.toggle();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Row(
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                padding: const EdgeInsets.only(right: 5),
                                child: Checkbox(
                                  value: controller.rememberMe.value,
                                  activeColor: KdColors.primary70,
                                  onChanged: (value) {
                                    controller.rememberMe.toggle();
                                  },
                                ),
                              ),
                              Text(
                                'Ingat saya',
                                style: KdTextStyles.body3Regular.copyWith(
                                  color: KdColors.neutral70,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.forgotPassword(context);
                      },
                      child: Text(
                        'Lupa kata sandi?',
                        style: KdTextStyles.body3Regular.copyWith(
                          color: KdColors.primary70,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: SizedBox(
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: KdButtonWidget(
                      text: 'Masuk',
                      buttonSizeType: ButtonSizeType.large,
                      onTapped: () {
                        controller.handleLogin(context);
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SizedBox(
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: KdButtonWidget(
                      text: 'Masuk dengan Google',
                      icon: KdAssetsImagesPath.iconsGoogle,
                      buttonSizeType: ButtonSizeType.large,
                      buttonType: ButtonType.tertiary,
                      onTapped: () {
                        controller.handleLoginWithGoogle(context);
                      },
                    ),
                  ),
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Belum punya akun? ',
                      style: KdTextStyles.body3Regular.copyWith(
                        color: KdColors.neutral70,
                      ),
                    ),
                    TextSpan(
                      text: 'Daftar',
                      style: KdTextStyles.body3Regular.copyWith(
                        color: KdColors.primary70,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          debugPrint('DAFTAR');
                          controller.navigationRegister();
                        },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'dibuat oleh',
                  style: KdTextStyles.caption2Regular.copyWith(
                    color: KdColors.primary70,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: Text(
                  'PT. Kelas Dunia Ekasakti',
                  style: KdTextStyles.caption1Medium.copyWith(
                    color: KdColors.neutral70,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Obx(
                () => Text(
                  'Versi ${controller.version.value}',
                  style: KdTextStyles.body3Regular.copyWith(
                    color: KdColors.neutral70,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
