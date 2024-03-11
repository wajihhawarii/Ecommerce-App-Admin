import 'package:adminappn/view/widgets/custombottonappbar_screenhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/orders/orderPage_Controller.dart';

class CustomBottomAppBarScreenHome extends StatelessWidget {
  const CustomBottomAppBarScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderScreenContrllerImp>(builder: (controller) {
      return SizedBox(
        height: 60,
        child: BottomAppBar(
          color: Colors.pink,
          shape: const CircularNotchedRectangle(), //تعمل قطع في الشريط
          notchMargin: 8,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...List.generate(controller.listpage.length, (index) {
                //  int i = index > 2 ? index - 1 : index;
                return CustomButtonAppBarScreenHome(
                    textbutton: controller.bottomappbar[index]['title'],
                    icondata: controller.bottomappbar[index]['icon'],
                    onPressed: () {
                      controller.changePage(index);
                    },
                    active: controller.currentpage == index ? true : false);
              })
            ],
          ),
        ),
      );
    });
  }
}
