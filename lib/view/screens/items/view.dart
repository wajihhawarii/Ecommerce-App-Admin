import 'package:adminappn/controller/items/view_controller.dart';
import 'package:adminappn/core/class/hundlingdata.dart';
import 'package:adminappn/core/constant/route.dart';
import 'package:adminappn/linkapi.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewitemsControllerImp());
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text(
            "Items",
            style: TextStyle(color: Colors.white),
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          Get.offNamed(AppRoute.itemsadd);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: GetBuilder<ViewitemsControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest!,
          widget: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                            flex: 1,
                            child: CachedNetworkImage(
                                height: 100,
                                imageUrl:
                                    "${AppLink.imageitems}/${controller.data[index].itemsImage}")),
                        Expanded(
                            flex: 1,
                            child: ListTile(
                              title: Text(controller.data[index].itemsName!),
                              subtitle: Text(controller.data[index].categoriesName!),
                            )),
                        Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    controller.goToItemsPageEdit(
                                        controller.data[index]);
                                  },
                                  icon: const Icon(Icons.edit_note_sharp),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Get.defaultDialog(
                                      title: "import",
                                      content: const Text(
                                          "Are you sure form Delete"),
                                      onCancel: () {},
                                      onConfirm: () {
                                        controller.deleteItems2(
                                            controller.data[index].itemsId!,
                                            controller.data[index].itemsImage!);
                                        Get.back();
                                      },
                                    );
                                  },
                                  icon: const Icon(Icons.delete),
                                ),
                              ],
                            )),
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
