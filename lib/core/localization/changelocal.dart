import 'package:adminappn/core/constant/route.dart';
import 'package:adminappn/core/function/fcmconfig.dart';
import 'package:adminappn/core/services/myservices.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

abstract class LanguageController extends GetxController {
  changeLang(String languagecode);
  goToOnBording();
}

class LanguageControllerImp extends LanguageController {
  Locale? language;
  MyServices myServices = Get.find();

  @override
  changeLang(String languagecode) {
    Locale locale = Locale(languagecode);
    myServices.sharedPreferences.setString("lang", languagecode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    requestPermissionNotification();
    fcmconfig();
    String? shared = myServices.sharedPreferences.getString("lang");
    if (shared == "ar") {
      language = const Locale("ar");
    } else if (shared == "en") {
      language = const Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }

  @override
  goToOnBording() {
    Get.toNamed(AppRoute.onbording);
  }
}
