import 'package:adminappn/core/class/statuserequest.dart';
import 'package:adminappn/core/function/hundlingdata.dart';
import 'package:adminappn/core/services/myservices.dart';
import 'package:adminappn/data/datasourse/remote/orders/pending_data.dart';
import 'package:adminappn/data/model/ordersmodel.dart';
import 'package:get/get.dart';

abstract class PendingsController extends GetxController {
  getOrders();
  approve(String userid, String orderid);
  String printOrderType(String val);
  String printPaymentMethodes(String val);
  String printOrderStatus(String val);
}

class PendingsControllerImp extends PendingsController {
  StatusRequest? statusRequest;
  OrdersPendingsData pendingsData = OrdersPendingsData(Get.find());
  MyServices myServices = Get.find();

  List<OrdersModel> data = [];

  @override
  String printOrderType(String val) {
    if (val == "0") {
      return "delivery";
    }
    return "Recive";
  }

  @override
  String printPaymentMethodes(String val) {
    if (val == "0") {
      return "Cach on delivery";
    }
    return "Payment Card";
  }

  @override
  String printOrderStatus(String val) {
    if (val == "0") {
      return "Await Approval";
    } else if (val == "1") {
      return "The Order is Being prepare";
    } else if (val == "2") {
      return "On The Way";
    } else {
      return "Archive";
    }
  }

  @override
  getOrders() async {
    statusRequest = StatusRequest.loading;
    update();
    data.clear();
    var respons = await pendingsData.getData();
    statusRequest =
        handlingData(respons); //عبارة عن دالة تتعامل مع القيمة المرجعة
    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        List listdata = respons['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure; //لا يوجد بيانات
      }
    }
    update();
  }

  @override
  approve(String userid, String orderid) async {
    statusRequest = StatusRequest.loading;
    update();
    data.clear();
    var respons = await pendingsData.approveOrder(userid, orderid);
    statusRequest =
        handlingData(respons); //عبارة عن دالة تتعامل مع القيمة المرجعة
    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        Get.snackbar("succsess", "The Order is Success");
      } else {
        statusRequest = StatusRequest.failure; //لا يوجد بيانات
      }
    }
    update();
  }

  refrehOrder() {
    getOrders();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
