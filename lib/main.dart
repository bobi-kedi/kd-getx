import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';
import 'app/config/firebase/firebase_options_dev.dart';

FutureOr<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // debugPrint('INIT MAIN DEV');
  // await Firebase.initializeApp(
  //   // name: 'kelas-digital-dev',
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  await GetStorage.init();
  debugPrint('INIT MAIN');
  runApp(App());
}
