import 'package:adminappn/core/class/curd.dart';
import 'package:adminappn/linkapi.dart';

class OrdersPendingsData {
  Curd crud;
  OrdersPendingsData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.viewpendingorder, {});
    return response.fold((l) => l, (r) => r); //لانها ترجع نوعين
  }

  approveOrder(String userid, String orderid) async {
    var response = await crud.postData(AppLink.approveorder, {
      "usersid": userid,
      "ordersid": orderid,
    });
    return response.fold((l) => l, (r) => r); //لانها ترجع نوعين
  }
}
