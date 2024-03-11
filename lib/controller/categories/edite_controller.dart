import 'dart:io';
import 'package:adminappn/core/class/statuserequest.dart';
import 'package:adminappn/core/constant/route.dart';
import 'package:adminappn/core/function/hundlingdata.dart';
import 'package:adminappn/core/function/uploadfile.dart';
import 'package:adminappn/core/services/myservices.dart';
import 'package:adminappn/data/datasourse/remote/categories_date.dart';
import 'package:adminappn/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

abstract class EditCategoriesController extends GetxController {
  editCategories();
}

class EditCategoriesControllerImp extends EditCategoriesController {
  CategoriesData categoriesData = CategoriesData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController? name;
  TextEditingController? namear;
  StatusRequest? statusRequest = StatusRequest.none;

  MyServices myServices = MyServices();

  File? file;
  CategoriesModel? categoriesModel;

  chooseImage() async {
    file = await fileUploadGallery();
    update();
  }

  @override
  editCategories() async {
    if (formstate.currentState!.validate()) {
      Map data = {
        "id": categoriesModel!.categoriesId.toString(),
        "name": name!.text,
        "namear": namear!.text,
        "imageold": categoriesModel!.categoriesImage,
      };
      statusRequest = StatusRequest.loading;
      update();
      var response = await categoriesData.editecategorie(data, file);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          print("11111111111111111111111111111111");
          Get.snackbar("The Categories is Edit Success",
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

  @override
  void onInit() {
    categoriesModel = Get.arguments["categoriesModel"];
    name = TextEditingController();
    namear = TextEditingController();
    name!.text = categoriesModel!.categoriesName!;
    namear!.text = categoriesModel!.categoriesNameAr!;
    super.onInit();
  }
}
