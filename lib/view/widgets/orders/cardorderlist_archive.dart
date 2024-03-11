import 'package:adminappn/controller/orders/archive_controller.dart';
import 'package:adminappn/core/constant/color.dart';
import 'package:adminappn/core/constant/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/model/ordersmodel.dart';

class CardOrderListArchive extends GetView<ArchiveControllerIm> {
  final OrdersModel listdata;
  final int? index;

  const CardOrderListArchive({
    super.key,
    required this.listdata,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
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
                Text("Time :${listdata.ordersDatetime!}"),
              ],
            ),
            const Divider(),
            Text(
                "Order Type : ${controller.printOrderType(listdata.ordersType!)}"),
            Text("Order price : ${listdata.ordersPrice}"),
            Text("delivery price : ${listdata.ordersPricedelivery}"),
            Text(
                "payment methodes :  ${controller.printPaymentMethodes(listdata.ordersPaymentmethodes!)}"),
            Text(
                "Order Status :  ${controller.printOrderStatus(listdata.ordersStatuse!)}"),
            const Divider(),
            Row(
              children: [
                Text("Total Price : ${listdata.ordersTotalprice}",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColor.red)),
                const Spacer(),
                MaterialButton(
                  minWidth: 20,
                  onPressed: () {
                    Get.toNamed(AppRoute.orderdetailes,
                        arguments: {"ordermodel": listdata});
                  },
                  color: AppColor.purpule,
                  textColor: Colors.white,
                  child: const Text('Detailes'),
                ),
                const SizedBox(
                  width: 5,
                ),
                if (listdata.ordersRating == "0")
                  MaterialButton(
                    minWidth: 20,
                    onPressed: () {
                      //   alertDialog(context, listdata.ordersId!);
                      //   Get.toNamed(AppRoute.ratingbar);
                    },
                    color: AppColor.purpule,
                    textColor: Colors.white,
                    child: const Text('Ratings'),
                  ),
                const SizedBox(
                  width: 10,
                ),
                // if (listdata.ordersStatuse == "0")
                //   MaterialButton(
                //     minWidth: 20,
                //     onPressed: () {
                //       controller.deleteData(listdata.ordersId!);
                //       // Get.toNamed(
                //       //   AppRoute.orderdetailes,arguments:{
                //       //        "ordermodel":listdata

                //       // }
                //       // );
                //     },
                //     color: Colors.green,
                //     textColor: Colors.amber,
                //     child: const Text('Delete'),
                //   ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// alertDialog(BuildContext context, String orderid) {
//   return showDialog(
//     context: context,
//     builder: (context) {
//       return RatingBar1(orderid: orderid);
//     },
//   );
// }
