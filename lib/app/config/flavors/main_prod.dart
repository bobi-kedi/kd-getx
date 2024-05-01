import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../firebase/firebase_options_prod.dart';
import 'flavors.dart';
import '../../../main.dart' as runner;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'kelas-digital-prod',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  F.appFlavor = Flavor.prod;
  await runner.main();
}
