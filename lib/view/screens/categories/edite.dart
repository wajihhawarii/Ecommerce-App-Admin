import 'package:adminappn/controller/categories/edite_controller.dart';
import 'package:adminappn/core/class/hundlingdata.dart';
import 'package:adminappn/core/function/valiadinput.dart';
import 'package:adminappn/core/shared/customtextformglobal.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CategoriesEdit extends StatelessWidget {
  const CategoriesEdit({super.key});

  @override
  Widget build(BuildContext context) {
    EditCategoriesControllerImp controllerImp =
        Get.put(EditCategoriesControllerImp());
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text("Edit Categories")),
      body: GetBuilder<EditCategoriesControllerImp>(
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
                      controller.chooseImage();
                    },
                  ),
                  if (controller.file != null) Image.file(controller.file!),
                  MaterialButton(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    color: Colors.blue,
                    child: const Text("save changes"),
                    onPressed: () {
                      controllerImp.editCategories();
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
