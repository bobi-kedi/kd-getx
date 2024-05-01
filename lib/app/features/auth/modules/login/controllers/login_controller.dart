import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kelasdigital/app/data/datasource/local/local_datasource.dart';
import 'package:kelasdigital/app/data/datasource/network/backend_remote_datasource.dart';
import 'package:kelasdigital/app/utils/services/app_services.dart';
import 'package:kelasdigital/app/utils/ui/app_ui.dart';

import '../../../../../config/routes/app_pages.dart';

class LoginController extends GetxController {
  final BackendRemoteDatasource rawData = BackendRemoteDatasource();
  final LocalDatasource localDatasource = LocalDatasource();
  RxBool showPassword = false.obs;
  RxBool rememberMe = false.obs;
  RxString version = ''.obs;
  RxStatus status = RxStatus.loading();

  final loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailC;
  late TextEditingController passwordC;

  @override
  void onInit() {
    getDeviceInfo();
    emailC = TextEditingController();
    passwordC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailC.dispose();
    passwordC.dispose();
    super.onClose();
  }

  void getDeviceInfo() async {
    try {
      var deviceInfo = await NativeApiServices().getInfoDevice();
      version.value = deviceInfo.version;
      localDatasource.saveVersion(version.value);
    } catch (e) {
      debugPrint('Error getDeviceInfo : $e');
    }
  }

  Future<void> handleLogin(BuildContext context) async {
    if (loginFormKey.currentState!.validate()) {
      loginFormKey.currentState!.save();
      KdDialog.loading(context);
      var result =
          await rawData.login(email: emailC.text, password: passwordC.text);

      result.fold(
        (failure) {
          status = RxStatus.error();
          Get.back();
          Get.snackbar('Authentication Error', failure.message);
          update();
        },
        (data) async {
          status = RxStatus.success();
          if (data.dataLogin != null) {
            localDatasource.saveToken(data.dataLogin!.accessToken!);
          }
          Get.back();
          Get.offNamedUntil(Routes.MAIN, (route) => false);
          update();
        },
      );
    }
  }

  Future<void> handleLoginWithGoogle(BuildContext context) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      KdDialog.loading(context);

      if (googleSignIn.currentUser != null) {
        await googleSignIn.signOut();
      }

      await InternetAddress.lookup('google.com');

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth != null) {
        var result =
            await rawData.loginWithGoogle(accessToken: googleAuth.accessToken!);

        result.fold(
          (failure) {
            status = RxStatus.error();
            Get.back();
            Get.snackbar('Authentication Error', failure.message);
            update();
          },
          (data) {
            status = RxStatus.success();
            if (data.dataLogin != null) {
              localDatasource.saveToken(data.dataLogin!.accessToken!);
            }
            Get.back();
            Get.offNamedUntil(Routes.MAIN, (route) => false);
            update();
          },
        );
      } else {
        Get.snackbar('Service Google Error',
            'failed to get token access from Google, please check the Google sign in service again');
      }
    } catch (e) {
      debugPrint('$e');
    }
  }

  void navigationRegister() {
    Get.toNamed(Routes.REGISTER);
  }

  void forgotPassword(BuildContext context) {
    Get.toNamed(Routes.RESET_PASSWORD);
  }
}
