import 'package:adminappn/controller/orders/home_controller.dart';
import 'package:adminappn/view/widgets/custombottomappbar_screenhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeOrders extends StatelessWidget {
  const HomeOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderHomeController());
    return GetBuilder<OrderHomeController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(title: const Text("Orders")),
        bottomNavigationBar: const CustomBottomAppBarScreenHome(),
        body: controller.listpage.elementAt(controller.currentpage),
      ),
    );
  }
}
