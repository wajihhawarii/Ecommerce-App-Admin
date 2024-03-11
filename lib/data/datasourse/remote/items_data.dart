import 'dart:io';

import 'package:adminappn/core/class/curd.dart';
import 'package:adminappn/linkapi.dart';

class ItemsData {
  Curd curd;
  ItemsData(this.curd);

  getitems() async {
    var response = await curd.postData(AppLink.itemsview, {});
    return response.fold((l) => l, (r) => r);
  }

  additems(Map data, File file) async {
    var response =
        await curd.addRequestWithImageOne(AppLink.itemsadd, data, file);
    return response.fold((l) => l, (r) => r);
  }

  deleteitems(Map data) async {
    var response = await curd.postData(AppLink.itmesdelete, data);
    return response.fold((l) => l, (r) => r);
  }

  editeitems(Map data, [File? file]) async {
    var response;
    if (file == null) {
      response = await curd.postData(AppLink.itemsedite, data);
    } else {
      response = await curd.addRequestWithImageOne(
          AppLink.categoriesedite, data, file);
    }
    return response.fold((l) => l, (r) => r);
  }
}
