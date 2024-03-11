import 'package:adminappn/controller/orders/accepted_controller.dart';
import 'package:adminappn/core/class/hundlingdata.dart';
import 'package:adminappn/view/widgets/orders/cardorderslist_accepted.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AcceptedOrders extends StatelessWidget {
  const AcceptedOrders({super.key});

  @override
  Widget build(BuildContext context) {
    AcepptedControllerImp controllerImp = Get.put(AcepptedControllerImp());
    if (controllerImp.number == 1) {
      controllerImp.number = 2;
    } else {
      controllerImp.refrehOrder();
    }
    {}
    return Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<AcepptedControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest!,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) => CardOrdersListAccepted(
                listdata: controller.data[index],
                index: index,
              ),
            ),
          ),
        ));
  }
}
