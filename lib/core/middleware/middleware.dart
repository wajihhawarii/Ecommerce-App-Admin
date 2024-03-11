// ignore: implementation_imports

import 'package:adminappn/core/constant/route.dart';
import 'package:adminappn/core/services/myservices.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';

class MiddleWare extends GetMiddleware {
  // ignore: annotate_overrides
  int? get priority => 1;
  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("A") == "1") {
      return const RouteSettings(name: AppRoute.homescreen);
    }
    return null;
  }
}
