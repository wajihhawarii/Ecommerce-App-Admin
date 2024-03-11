import 'package:adminappn/view/screens/orders/accepted.dart';
import 'package:adminappn/view/screens/orders/pending.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderHomeController extends GetxController {
  int currentpage = 0;

  List<Widget> listpage = [
    const PendingsOrders(),
    const AcceptedOrders(),
  ];

  List bottomappbar = [
    {"title": "pendings", "icon": Icons.home},
    {"title": "Accepted", "icon": Icons.add_shopping_cart},
  ];

  changePage(int i) {
    currentpage = i;
    update();
  }
}
