import 'package:cropaid_app/routes/routes.dart';
import 'package:cropaid_app/screens/common/theme.dart';
import 'package:cropaid_app/services/push_notification_service.dart';
import 'package:cropaid_app/utils/languages.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'controllers/bindings/auth_binding.dart';

class CropAidApp extends StatelessWidget {
  CropAidApp() {
    PushNotificationService().initialise();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "CropAid",
      debugShowCheckedModeBanner: false,
      initialBinding: AuthBinding(),
      theme: CropAidThemes.light,
      initialRoute: "/",
      getPages: GetPages.init(),
      defaultTransition: Transition.zoom,
      translations: Languages(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
    );
  }
}
