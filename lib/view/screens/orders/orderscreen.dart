import 'package:adminappn/controller/orders/orderPage_Controller.dart';
import 'package:adminappn/core/constant/color.dart';
import 'package:adminappn/view/widgets/custombottomappbar_screenhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OrderScreenContrllerImp homeScreenController =
        Get.put(OrderScreenContrllerImp());
    return GetBuilder<OrderScreenContrllerImp>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          centerTitle: true,
          title: const Text(
            "Orders",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        backgroundColor: AppColor.white,
        bottomNavigationBar: const CustomBottomAppBarScreenHome(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: homeScreenController.listpage
            .elementAt(homeScreenController.currentpage),
      ),
    );
  }
}
