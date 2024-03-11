import 'package:adminappn/view/screens/orders/accepted.dart';
import 'package:adminappn/view/screens/orders/pending.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OrderScreenController extends GetxController {
  changePage(int currentpage);
}

class OrderScreenContrllerImp extends OrderScreenController {
  int currentpage = 0;

  List listpage = const [
    PendingsOrders(),
    AcceptedOrders(),
  ];

  List bottomappbar = [
    {
      "title": "Pendings",
      "icon": Icons.alarm,
    },
    {
      "title": "Accepted",
      "icon": Icons.access_alarm,
    },
  ];

  @override
  // ignore: avoid_renaming_method_parameters
  changePage(int i) {
    currentpage = i;
    update();
  }
}
