import 'dart:io';
import 'package:adminappn/core/class/statuserequest.dart';
import 'package:adminappn/core/constant/route.dart';
import 'package:adminappn/core/function/hundlingdata.dart';
import 'package:adminappn/core/function/uploadfile.dart';
import 'package:adminappn/core/services/myservices.dart';
import 'package:adminappn/data/datasourse/remote/categories_date.dart';
import 'package:adminappn/data/datasourse/remote/items_data.dart';
import 'package:adminappn/data/model/categoriesmodel.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

abstract class AddItemsController extends GetxController {
  addItems();
  showOptionImage();
  getCategories();
}

class AddItemsControllerImp extends AddItemsController {
  ItemsData itemsData = ItemsData(Get.find());
  StatusRequest? statusRequest = StatusRequest.none;
  MyServices myServices = MyServices();
  File? file;

  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController? dropdownname;
  TextEditingController? dropdownid;

  TextEditingController? name;
  TextEditingController? namear;
  TextEditingController? desc;
  TextEditingController? descar;
  TextEditingController? count;
  TextEditingController? price;
  TextEditingController? discount;
  TextEditingController? catid;
  TextEditingController? datenow;

  TextEditingController? catname;

  @override
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
  addItems() async {
    if (formstate.currentState!.validate()) {
      if (file == null) {
        return Get.snackbar("Error", "Pleace choose Items Image");
      }
      Map data = {
        "name": name!.text,
        "namear": namear!.text,
        "desc": desc!.text,
        "descar": descar!.text,
        "count": count!.text,
        "price": price!.text,
        "discount": discount!.text,
        "catid": catid!.text,
        "datenow": DateTime.now().toString(),
      };
      statusRequest = StatusRequest.loading;
      update();
      var response = await itemsData.additems(data, file!);
      print("0000000000000000000000000000000000");
      print(response);
      print("0000000000000000000000000000000000");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          print("11111111111111111111111111111111");
          Get.snackbar("The Items is Add Success", "The Items is Add Scuccess");
          Get.offAllNamed(AppRoute.itemsview);
          // ViewCategorisControllerImp controllerImp = Get.find();
          // controllerImp.getItems();
        } else {
          print('222222222222222222222222222222');
        }
      } else {
        print("333333333333333333333333333333");
      }
      update();
    }
  }

  List<SelectedListItem> listlist = [];
  @override
  getCategories() async {
    CategoriesData categoriesData = CategoriesData(Get.find());
    statusRequest = StatusRequest.loading;
    var response = await categoriesData.getCategories();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List<CategoriesModel> data = [];
        List datalist = response['data'];
        data.addAll(datalist.map((e) => CategoriesModel.fromJson(e)));
        for (int i = 0; i < data.length; i++) {
          listlist.add(SelectedListItem(
              name: data[i].categoriesName!, value: data[i].categoriesId));
        }
      } else {
        print('222222222222222222222222222222');
      }
    } else {
      print("333333333333333333333333333333");
    }
    update();
  }

  @override
  void onInit() {
    getCategories();
    dropdownname = TextEditingController();
    dropdownid = TextEditingController();
    name = TextEditingController();
    namear = TextEditingController();
    desc = TextEditingController();
    descar = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
    count = TextEditingController();
    datenow = TextEditingController();
    catname = TextEditingController();
    catid = TextEditingController();
    super.onInit();
  }
}
