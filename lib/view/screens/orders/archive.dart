import 'package:adminappn/controller/orders/archive_controller.dart';
import 'package:adminappn/core/class/hundlingdata.dart';
import 'package:adminappn/core/constant/route.dart';
import 'package:adminappn/view/widgets/orders/cardorderlist_archive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArchiveOrders extends StatelessWidget {
  const ArchiveOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArchiveControllerIm());
    return Scaffold(
        appBar: AppBar(
            title: const Text("Ordes Archive",
                style: TextStyle(color: Colors.white)),
            leading: IconButton(
              onPressed: () {
                Get.toNamed(AppRoute.homescreen);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            )),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: GetBuilder<ArchiveControllerIm>(
              builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest!,
                widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) => CardOrderListArchive(
                    listdata: controller.data[index],
                    index: index,
                  ),
                ),
              ),
            )));
  }
}
