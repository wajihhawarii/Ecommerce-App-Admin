import 'package:adminappn/controller/orders/accepted_controller.dart';
import 'package:adminappn/core/constant/color.dart';
import 'package:adminappn/core/constant/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import '../../../data/model/ordersmodel.dart';

class CardOrdersListAccepted extends GetView<AcepptedControllerImp> {
  final OrdersModel listdata;
  final int? index;

  const CardOrdersListAccepted({
    super.key,
    required this.listdata,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return listdata.ordersStatuse == "3"
        ? Card(
            child: Container(
              color: AppColor.grey,
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("OrderNumber:${listdata.ordersId}",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const Spacer(),
                      //  Text("Time :${listdata.ordersDatetime!}"),
                      Text(
                        Jiffy(listdata.ordersDatetime!, "yyyy-MM-dd").fromNow(),
                        style: const TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Divider(),
                  Text(
                      "Order Type : ${controller.printOrderType(listdata.ordersType!)}"),
                  Text("Order price : ${listdata.ordersPrice}"),
                  Text("delivery price : ${listdata.ordersPricedelivery}"),
                  Text(
                      "payment methodes :  ${controller.printPaymentMethodes(listdata.ordersPaymentmethodes!)}"),
                  //  Text("Order Status :  ${controller.printOrderStatus(listdata.ordersStatuse!)}"),
                  const Divider(),
                  Row(
                    children: [
                      Text("Total Price : ${listdata.ordersTotalprice}",
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.red)),
                      const Spacer(),
                      MaterialButton(
                        minWidth: 20,
                        onPressed: () {
                          Get.toNamed(AppRoute.orderdetailes,
                              arguments: {"ordermodel": listdata});
                        },
                        color: Colors.pink,
                        textColor: Colors.white,
                        child: const Text('Detailes'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      if (listdata.ordersStatuse == "3")
                        MaterialButton(
                          minWidth: 20,
                          onPressed: () {
                            // controller.doneDelivery(
                            //     listdata.ordersUsersid!, listdata.ordersId!);
                          },
                          color: Colors.pink,
                          textColor: Colors.white,
                          child: const Text('Done'),
                        ),

                      // if (listdata.ordersStatuse == "2")
                      //   MaterialButton(
                      //     minWidth: 20,
                      //     onPressed: () {
                      //       // controller.approve(
                      //       //     listdata.ordersUsersid!, listdata.ordersId!);
                      //     },
                      //     color: AppColor.purpule,
                      //     textColor: Colors.white,
                      //     child: const Text('Approve'),
                      //   ),
                    ],
                  )
                ],
              ),
            ),
          )
        : const Text("There is Not Found Orders");
  }
}
