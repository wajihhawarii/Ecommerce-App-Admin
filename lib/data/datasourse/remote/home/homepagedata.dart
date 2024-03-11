import 'package:adminappn/core/class/curd.dart';
import 'package:adminappn/linkapi.dart';

class HomeData {
  Curd crud;
  HomeData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.login, {});
    return response.fold((l) => l, (r) => r); //لانها ترجع نوعين
  }

  searchData(
    String search,
  ) async {
    var response = await crud.postData(AppLink.login, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
