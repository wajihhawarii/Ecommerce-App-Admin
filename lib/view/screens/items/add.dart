import 'package:adminappn/controller/Items/add_controller.dart';
import 'package:adminappn/core/class/hundlingdata.dart';
import 'package:adminappn/core/function/valiadinput.dart';
import 'package:adminappn/core/shared/customdropdownsearch.dart';
import 'package:adminappn/core/shared/customtextformglobal.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ItemsAdd extends StatelessWidget {
  const ItemsAdd({super.key});

  @override
  Widget build(BuildContext context) {
    AddItemsControllerImp controllerImp = Get.put(AddItemsControllerImp());
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.red, title: const Text("Add Items")),
      body: GetBuilder<AddItemsControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controllerImp.statusRequest!,
          widget: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: controllerImp.formstate,
              child: ListView(
                children: [
                  CustomTextFormFiledGlobal(
                      hintText: "Enter The Name Item",
                      keyboardType: TextInputType.name,
                      icon: const Icon(Icons.category),
                      validator: (val) {
                        return validInput(val!, 5, 50, "");
                      },
                      mycontroller: controllerImp.name),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: CustomTextFormFiledGlobal(
                        hintText: "Enter The Name Item  (Arabic)",
                        keyboardType: TextInputType.name,
                        icon: const Icon(Icons.category),
                        validator: (val) {
                          return validInput(val!, 5, 50, "");
                        },
                        mycontroller: controllerImp.namear),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: CustomTextFormFiledGlobal(
                        hintText: "Enter The description Item ",
                        keyboardType: TextInputType.name,
                        icon: const Icon(Icons.category),
                        validator: (val) {
                          return validInput(val!, 5, 50, "");
                        },
                        mycontroller: controllerImp.desc),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: CustomTextFormFiledGlobal(
                        hintText: "Enter The description Item   (Arabic)",
                        keyboardType: TextInputType.name,
                        icon: const Icon(Icons.category),
                        validator: (val) {
                          return validInput(val!, 5, 50, "");
                        },
                        mycontroller: controllerImp.descar),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: CustomTextFormFiledGlobal(
                        hintText: "Enter The Count Items  ",
                        keyboardType: TextInputType.name,
                        icon: const Icon(Icons.category),
                        validator: (val) {
                          return validInput(val!, 1, 50, "");
                        },
                        mycontroller: controllerImp.count),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: CustomTextFormFiledGlobal(
                        hintText: "Enter The Price Item ",
                        keyboardType: TextInputType.name,
                        icon: const Icon(Icons.category),
                        validator: (val) {
                          return validInput(val!, 1, 50, "");
                        },
                        mycontroller: controllerImp.price),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: CustomTextFormFiledGlobal(
                        hintText: "Enter The Discount item ",
                        keyboardType: TextInputType.name,
                        icon: const Icon(Icons.category),
                        validator: (val) {
                          return validInput(val!, 1, 50, "");
                        },
                        mycontroller: controllerImp.discount),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(5),
                  //   child: CustomTextFormFiledGlobal(
                  //       hintText: "Enter The DateNow ",
                  //       keyboardType: TextInputType.name,
                  //       icon: const Icon(Icons.category),
                  //       validator: (val) {
                  //         return validInput(val!, 1, 50, "");
                  //       },
                  //       mycontroller: controllerImp.datenow),
                  // ),
                  CustomDrobDownSearch(
                    title: "categories",
                    listdata: controllerImp.listlist,
                    dropDownSelectedName: controller.catname!,
                    dropDownSelectedID: controller.catid!,
                  ),
                  MaterialButton(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    color: Colors.red,
                    child: const Text("Choose Items Image"),
                    onPressed: () {
                      controllerImp.showOptionImage();
                    },
                  ),
                  if (controller.file != null) Image.file(controller.file!),
                  MaterialButton(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    color: Colors.blue,
                    child: const Text("Add Item "),
                    onPressed: () {
                      controller.addItems();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
