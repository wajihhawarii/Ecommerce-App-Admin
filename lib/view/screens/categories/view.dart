import 'package:adminappn/controller/categories/view_controller.dart';
import 'package:adminappn/core/class/hundlingdata.dart';
import 'package:adminappn/core/constant/route.dart';
import 'package:adminappn/linkapi.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewCategorisControllerImp());
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text(
            "Categories",
            style: TextStyle(color: Colors.white),
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          Get.offNamed(AppRoute.categoriesadd);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: GetBuilder<ViewCategorisControllerImp>(
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
                                    "${AppLink.imagecategories}/${controller.data[index].categoriesImage}")),
                        Expanded(
                            flex: 1,
                            child: ListTile(
                              title:
                                  Text(controller.data[index].categoriesName!),
                            )),
                        Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    controller.goToCategoriesPageEdit(
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
                                        controller.deleteCategories2(
                                            controller
                                                .data[index].categoriesId!,
                                            controller
                                                .data[index].categoriesImage!);
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
