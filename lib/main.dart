import 'package:adminappn/core/localization/changelocal.dart';
import 'package:adminappn/core/localization/translation.dart';
import 'package:adminappn/core/services/myservices.dart';
import 'package:adminappn/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'bindings/bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget { 
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LanguageControllerImp languageControllerImp =
        Get.put(LanguageControllerImp());

    return GetMaterialApp(
      translations: MyTranslation(),
      initialBinding: InialBindings(),
      locale: languageControllerImp.language,
      debugShowCheckedModeBanner: false,
      getPages: routes,
    );
  }
}
