import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../firebase/firebase_options_dev.dart';
import 'flavors.dart';
import '../../../main.dart' as runner;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  debugPrint('INIT MAIN DEV');
  await Firebase.initializeApp(
    // name: 'kelas-digital-dev',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  F.appFlavor = Flavor.dev;
  await runner.main();
}
