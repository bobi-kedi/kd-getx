import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:kelasdigital/app/config/constant/app_constant.dart';
import 'package:kelasdigital/app/data/datasource/local/local_datasource.dart';
import 'package:kelasdigital/app/data/models/app_models.dart';

import 'package:http/http.dart' as http;
import 'package:kelasdigital/app/data/models/auth/profile_model_model.dart';
import 'package:kelasdigital/app/data/models/general_meta_model.dart';

import '../../../config/error/app_error.dart';

class BackendRemoteDatasource {
  static final BackendRemoteDatasource _backendRemoteDatasource =
      BackendRemoteDatasource._internal();

  factory BackendRemoteDatasource() {
    return _backendRemoteDatasource;
  }
  BackendRemoteDatasource._internal();

  http.Client client = http.Client();
  LocalDatasource localDatasource = LocalDatasource();

  Future<Either<Failure, LoginModel>> login(
      {required String email, required String password}) async {
    try {
      var data = {
        "email": email,
        "password": password,
      };

      final result =
          await client.post(Uri.parse(KdApiPath.authLogin), body: data);

      if (kDebugMode) {
        debugPrint('Headers : ${result.headers}');
        debugPrint('Request : ${result.request}');
        debugPrint('Status Code : ${result.statusCode}');
        debugPrint('Response : ${json.decode((result.body))}');
      }

      if (result.statusCode >= 200 && result.statusCode <= 300) {
        return Right(LoginModel.fromJson(json.decode((result.body))));
      } else {
        var error = GeneralMeta.fromJson(json.decode((result.body)));
        return Left(
            ServerFailure('${error.meta?.message}(${error.meta?.statusCode})'));
      }
    } on ServerException {
      return const Left(
          ServerFailure('Server not responding. Please try later'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  Future<Either<Failure, LoginModel>> loginWithGoogle(
      {required String accessToken}) async {
    try {
      var data = {"accessToken": accessToken};

      final result =
          await client.post(Uri.parse(KdApiPath.authGoogleVerify), body: data);

      if (kDebugMode) {
        debugPrint('Data : $data');
        debugPrint('Headers : ${result.headers}');
        debugPrint('Request : ${result.request}');
        debugPrint('Status Code : ${result.statusCode}');
        debugPrint('Response : ${json.decode((result.body))}');
      }

      if (result.statusCode >= 200 && result.statusCode <= 300) {
        return Right(LoginModel.fromJson(json.decode((result.body))));
      } else {
        var error = GeneralMeta.fromJson(json.decode((result.body)));
        return Left(
            ServerFailure('${error.meta?.message}(${error.meta?.statusCode})'));
      }
    } on ServerException {
      return const Left(
          ServerFailure('Server not responding. Please try later'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  Future<Either<Failure, ProfileModel>> profile() async {
    try {
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

      var token = await localDatasource.getToken();
      var locale = await localDatasource.getLocale();
      var version = await localDatasource.getVersion();

      if (token.isNotEmpty) {
        requestHeaders['Authorization'] = 'Bearer $token';
      }

      if (locale != null) {
        requestHeaders['lang'] = locale;
      }

      if (version.isNotEmpty) {
        requestHeaders['x-mobile-version'] = version;
      }

      debugPrint('request header :$requestHeaders');

      final result = await client.get(
        Uri.parse(KdApiPath.authProfile),
        headers: requestHeaders,
      );

      if (kDebugMode) {
        debugPrint('Headers : ${result.headers}');
        debugPrint('Request : ${result.request}');
        debugPrint('Status Code : ${result.statusCode}');
        debugPrint('Response : ${json.decode((result.body))}');
      }

      if (result.statusCode >= 200 && result.statusCode <= 300) {
        return Right(ProfileModel.fromJson(json.decode((result.body))));
      } else {
        var error = GeneralMeta.fromJson(json.decode((result.body)));
        return Left(
            ServerFailure('${error.meta?.message}(${error.meta?.statusCode})'));
      }
    } on ServerException {
      return const Left(
          ServerFailure('Server not responding. Please try later'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
