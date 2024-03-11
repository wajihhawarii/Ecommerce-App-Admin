import 'package:adminappn/core/services/myservices.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';

translateDataFromDataBase(dataAr, dataEn) {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString("lang") == "ar") {
    return dataAr;
  } else {
    return dataEn;
  }
}
