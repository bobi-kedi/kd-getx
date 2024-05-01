import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/config/translation/generated/locales.g.dart';
import 'app/features/auth/controller/auth_controller.dart';
import 'app/config/routes/app_pages.dart';
import 'app/shared/styles/app_styles.dart';

class App extends StatelessWidget {
  App({super.key});

  final authC = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: authC.firstInitialize(),
      builder: (context, snapshoot) {
        if (snapshoot.connectionState == ConnectionState.done) {
          return Obx(
            () => GetMaterialApp(
              title: "Kelas Digital",
              debugShowCheckedModeBanner: false,
              locale: authC.locale,
              fallbackLocale: const Locale('id', 'ID'),
              translationsKeys: AppTranslation.translations,
              darkTheme: ThemeData.dark(),
              themeMode: ThemeMode.system,
              initialRoute: authC.isSkipIntro.isTrue
                  ? authC.isAuth.isTrue
                      ? Routes.MAIN
                      : Routes.WELCOME
                  : Routes.CHANGE_LANGUAGE,
              getPages: AppPages.routes,
            ),
          );
        }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: KdColors.primary70,
              ),
            ),
          ),
        );
      },
    );
  }
}
