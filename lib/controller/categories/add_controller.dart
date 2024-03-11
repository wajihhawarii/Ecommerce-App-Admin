import 'dart:io';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:adminappn/core/class/statuserequest.dart';
import 'package:adminappn/core/constant/route.dart';
import 'package:adminappn/core/function/hundlingdata.dart';
import 'package:adminappn/core/function/uploadfile.dart';
import 'package:adminappn/core/services/myservices.dart';
import 'package:adminappn/data/datasourse/remote/categories_date.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

abstract class AddCategoriesController extends GetxController {
  addCategories();
}

class AddCategoriesControllerImp extends AddCategoriesController {
  CategoriesData categoriesData = CategoriesData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController? name;
  TextEditingController? namear;
  TextEditingController? desc;
  TextEditingController? descar;
  TextEditingController? count;
  TextEditingController? price;
  TextEditingController? disCount;
  StatusRequest? statusRequest = StatusRequest.none;

  MyServices myServices = MyServices();

  File? file;

  showOptionImage() {
    showBottomMenu(chooseImageFromCamera, chooseImageFromGallery);
  }

  chooseImageFromCamera() async {
    file = await imageUpLoadCammera();
    update();
  }

  chooseImageFromGallery() async {
    file = await fileUploadGallery();
    update();
  }

  @override
  addCategories() async {
    if (formstate.currentState!.validate()) {
      if (file == null) {
        return Get.snackbar("Error", "Pleace choose Categories Image");
      }
      Map data = {
        "name": name!.text,
        "namear": namear!.text,
      };
      statusRequest = StatusRequest.loading;
      update();
      var response = await categoriesData.addCategorie(data, file!);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          print("11111111111111111111111111111111");
          Get.snackbar("The Categories is Add Success",
              "The Categories is Add Scuccess");
          Get.offAllNamed(AppRoute.categoriesview);
          // ViewCategorisControllerImp controllerImp = Get.find();
          // controllerImp.getCategories();
        } else {
          print('222222222222222222222222222222');
        }
      } else {
        print("333333333333333333333333333333");
      }
      update();
    }
  }

  showDropDown(BuildContext context) {
    DropDownState(
      DropDown(
        bottomSheetTitle: const Text(
          "title",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: [
          SelectedListItem(name: "a"),
          SelectedListItem(name: "b"),
          SelectedListItem(name: "c"),
          SelectedListItem(name: "d"),
        ], //هي مجوعة من البيانات
        selectedItems: (List<dynamic> selectedList) {
          List<String> list = [];
          for (var item in selectedList) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          //  showSnackBar(list.toString());
        },
        enableMultipleSelection: true,
      ),
    ).showModal(context);
  }

  @override
  void onInit() {
    name = TextEditingController();
    namear = TextEditingController();
    desc = TextEditingController();
    descar = TextEditingController();
    count = TextEditingController();
    price = TextEditingController();
    disCount = TextEditingController();
    super.onInit();
  }
}
