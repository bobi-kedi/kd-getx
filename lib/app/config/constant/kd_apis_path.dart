part of 'app_constant.dart';

class KdApiPath {
  static String baseUrl = '${F.url}/api';

  static String authLogin = "$baseUrl/auth/login";
  static String authGoogleVerify = "$baseUrl/auth/google/verify";
  static String authProfile = "$baseUrl/auth/profile";
}
