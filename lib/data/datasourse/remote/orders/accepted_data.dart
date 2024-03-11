import 'package:adminappn/core/class/curd.dart';
import 'package:adminappn/linkapi.dart';

class OrderAcceptedData {
  Curd crud;
  OrderAcceptedData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.viewacceptedorder, {});
    return response.fold((l) => l, (r) => r); //لانها ترجع نوعين
  }

  donePrepare(String usersid, String deliveryid,String orderstype) async {
    var response = await crud.postData(AppLink.prepareorder, {
      "usersid": usersid,
      "ordersid": deliveryid, 
     "ordertype":orderstype,
    });
    return response.fold((l) => l, (r) => r); //لانها ترجع نوعين
  }
}
