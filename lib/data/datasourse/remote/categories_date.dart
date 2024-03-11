import 'dart:io';

import 'package:adminappn/core/class/curd.dart';
import 'package:adminappn/linkapi.dart';

class CategoriesData {
  Curd curd;
  CategoriesData(this.curd);

  getCategories() async {
    var response = await curd.postData(AppLink.categoriesview, {});
    return response.fold((l) => l, (r) => r);
  }

  addCategorie(Map data, File file) async {
    var response =
        await curd.addRequestWithImageOne(AppLink.categoriesadd, data, file);
    return response.fold((l) => l, (r) => r);
  }

  deleteCategorie(Map data) async {
    var response = await curd.postData(AppLink.categoriesdelete, data);
    return response.fold((l) => l, (r) => r);
  }

  editecategorie(Map data, [File? file]) async {
    var response;
    if (file == null) {
      response = await curd.postData(AppLink.categoriesedite, data);
    } else {
      response = await curd.addRequestWithImageOne(
          AppLink.categoriesedite, data, file);
    }
    return response.fold((l) => l, (r) => r);
  }
}
