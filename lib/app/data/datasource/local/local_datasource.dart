import 'package:flutter/material.dart';

import '../../../config/constant/app_constant.dart';
import 'package:get_storage/get_storage.dart' as get_storage;

class LocalDatasource {
  static final LocalDatasource _localDatasource = LocalDatasource._internal();

  factory LocalDatasource() {
    return _localDatasource;
  }
  LocalDatasource._internal();

  final box = get_storage.GetStorage();

  Future<void> saveSkipOnboard() async {
    debugPrint('saveSkipOnboard');
    if (box.read(KdConstants.skripIntro) != null) {
      box.remove(KdConstants.skripIntro);
    }
    box.write(KdConstants.skripIntro, true);
  }

  Future<bool> getSkipOnboard() async {
    debugPrint('getSkipOnboard : ${box.read(KdConstants.skripIntro)}');
    return box.read(KdConstants.skripIntro);
  }

  Future<void> saveLocale(String locale) async {
    debugPrint('saveLocale');
    if (box.read(KdConstants.locale) != null) {
      box.remove(KdConstants.locale);
    }
    box.write(KdConstants.locale, locale);
  }

  Future<String?> getLocale() async {
    debugPrint('getLocale : ${box.read(KdConstants.locale)}');
    String? locale = box.read(KdConstants.locale);
    return locale;
  }

  Future<void> saveToken(String token) async {
    debugPrint('saveToken');
    if (box.read(KdConstants.accessToken) != null) {
      box.remove(KdConstants.accessToken);
    }
    box.write(KdConstants.accessToken, token);
  }

  Future<String> getToken() async {
    debugPrint('getToken : ${box.read(KdConstants.accessToken)}');
    return box.read(KdConstants.accessToken);
  }

  Future<void> clearToken() async {
    box.remove(KdConstants.accessToken);
  }

  Future<void> saveVersion(String version) async {
    debugPrint('saveVersion');
    if (box.read(KdConstants.version) != null) {
      box.remove(KdConstants.version);
    }
    box.write(KdConstants.version, version);
  }

  Future<String> getVersion() async {
    debugPrint('getToken : ${box.read(KdConstants.version)}');
    return box.read(KdConstants.version);
  }
}
