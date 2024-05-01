class LoginModel {
  DataLogin? dataLogin;

  LoginModel({this.dataLogin});

  LoginModel.fromJson(Map<String, dynamic> json) {
    dataLogin = json['data'] != null ? DataLogin?.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (dataLogin != null) {
      data['data'] = dataLogin?.toJson();
    }
    return data;
  }
}

class DataLogin {
  String? accessToken;
  bool? isRegistered;
  String? email;
  String? phoneNumber;
  String? provider;
  String? username;
  bool? linkedWithGoogle;
  bool? isOtpVerified;

  DataLogin({
    this.accessToken,
    this.isRegistered,
    this.email,
    this.phoneNumber,
    this.provider,
    this.username,
    this.linkedWithGoogle,
    this.isOtpVerified,
  });

  DataLogin.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    isRegistered = json['is_registered'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    provider = json['provider'];
    username = json['username'];
    linkedWithGoogle = json['linkedWithGoogle'];
    isOtpVerified = json['isOtpVerified'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['is_registered'] = isRegistered;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['provider'] = provider;
    data['username'] = username;
    data['linkedWithGoogle'] = linkedWithGoogle;
    data['isOtpVerified'] = isOtpVerified;
    return data;
  }

  // @override
  // String toString() =>
  //     'Login(access_token: $accessToken, is_registered : $isRegistered, email : $email, phoneNumber : $phoneNumber)';
}
