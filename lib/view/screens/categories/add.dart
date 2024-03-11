import 'package:adminappn/controller/categories/add_controller.dart';
import 'package:adminappn/core/class/hundlingdata.dart';
import 'package:adminappn/core/function/valiadinput.dart';
import 'package:adminappn/core/shared/customtextformglobal.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CategoriesAdd extends StatelessWidget {
  const CategoriesAdd({super.key});

  @override
  Widget build(BuildContext context) {
    AddCategoriesControllerImp controllerImp =
        Get.put(AddCategoriesControllerImp());
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.red, title: const Text("Add Categories")),
      body: GetBuilder<AddCategoriesControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controllerImp.statusRequest!,
          widget: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: controllerImp.formstate,
              child: ListView(
                children: [
                  CustomTextFormFiledGlobal(
                      hintText: "Enter The Name Categories",
                      keyboardType: TextInputType.name,
                      icon: const Icon(Icons.category),
                      validator: (val) {
                        return validInput(val!, 5, 50, "");
                      },
                      mycontroller: controllerImp.namear),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: CustomTextFormFiledGlobal(
                        hintText: "Enter The Name Categories  (Arabic)",
                        keyboardType: TextInputType.name,
                        icon: const Icon(Icons.category),
                        validator: (val) {
                          return validInput(val!, 5, 50, "");
                        },
                        mycontroller: controllerImp.name),
                  ),
                  MaterialButton(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    color: Colors.red,
                    child: const Text("Choose Categories Image"),
                    onPressed: () {
                      controller.showOptionImage();
                    },
                  ),
                  if (controller.file != null) Image.file(controller.file!),
                  MaterialButton(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    color: Colors.blue,
                    child: const Text("Add Categories Image"),
                    onPressed: () {
                      controllerImp.addCategories();
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
