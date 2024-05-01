import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelasdigital/app/data/datasource/network/backend_remote_datasource.dart';

import '../../../data/datasource/local/local_datasource.dart';

class AuthController extends GetxController {
  final LocalDatasource localDatasource = LocalDatasource();
  final BackendRemoteDatasource rawData = BackendRemoteDatasource();
  RxBool isSkipIntro = false.obs;
  RxBool isAuth = false.obs;
  Locale? locale;

  Future<void> firstInitialize() async {
    await getLocale();
    await skipOnboard().then((value) async {
      if (value) {
        isSkipIntro.value = value;
        await autoLogin().then((value) {
          if (value) {
            isAuth.value = true;
          }
        });
      }
    });
  }

  Future<void> getLocale() async {
    String? lang = await localDatasource.getLocale();
    if (lang != null) {
      locale = Locale(lang);
    } else {
      locale = Get.locale ?? Get.deviceLocale;
    }
  }

  Future<bool> autoLogin() async {
    var token = await localDatasource.getToken();
    if (token.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<bool> skipOnboard() async {
    var skip = await localDatasource.getSkipOnboard();
    if (skip) {
      return true;
    }
    return false;
  }

  Future<void> getProfile() async {
    await rawData.profile();
  }
}
