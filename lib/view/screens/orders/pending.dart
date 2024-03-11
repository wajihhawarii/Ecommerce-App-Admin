import 'package:adminappn/controller/orders/pending_controller.dart';
import 'package:adminappn/core/class/hundlingdata.dart';
import 'package:adminappn/view/widgets/orders/cardorderlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PendingsOrders extends StatelessWidget {
  const PendingsOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PendingsControllerImp());
    return Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<PendingsControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest!,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) => CardOrdersListPendings(
                listdata: controller.data[index],
                index: index,
              ),
            ),
          ),
        ));
  }
}
