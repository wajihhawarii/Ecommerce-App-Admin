import 'package:adminappn/controller/orders/detailes_controller.dart';
import 'package:adminappn/core/class/hundlingdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailes extends StatelessWidget {
  const OrderDetailes({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersDetailsController());
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.white,
              )),
          backgroundColor: Colors.pink,
          title: const Text(
            "Orders Detailes",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: GetBuilder<OrdersDetailsController>(
            builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  Card(
                    child: Table(
                      children: [
                        const TableRow(children: [
                          Text("type",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          Text("number",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          Text("price",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ]),
                        ...List.generate(
                          controller.data.length,
                          (index) => TableRow(children: [
                            Text("${controller.data[index].itemsName}",
                                textAlign: TextAlign.center),
                            Text(
                              "${controller.data[index].countitems}",
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "${controller.data[index].itemsPrice}",
                              textAlign: TextAlign.center,
                            ),
                          ]),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        "Total Price :${controller.ordersModel.ordersTotalprice}\$",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (controller.ordersModel.ordersType == "0")
                    Card(
                      elevation: 5,
                      child: ListTile(
                        title: Text("${controller.ordersModel.addressCity}"),
                        subtitle:
                            Text("${controller.ordersModel.addressStreet}"),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ));
  }
}
