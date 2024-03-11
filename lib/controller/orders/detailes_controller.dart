import 'package:adminappn/core/class/statuserequest.dart';
import 'package:adminappn/core/function/hundlingdata.dart';
import 'package:adminappn/data/datasourse/remote/orders/detailes_data.dart';
import 'package:adminappn/data/model/cartmodel.dart';
import 'package:adminappn/data/model/ordersmodel.dart';
import 'package:get/get.dart';

class OrdersDetailsController extends GetxController {
  OrdersDetailesData ordersDetailsData = OrdersDetailesData(Get.find());
  List<CartModel> data = [];
  late StatusRequest statusRequest;
  late OrdersModel ordersModel;

  // Completer<GoogleMapController>? completercontroller;

  // List<Marker> markers = [];

  double? lat;
  double? long;

  //CameraPosition? cameraPosition;

  // intialData() {
  //   if (ordersModel.ordersType == "0") {
  //     cameraPosition = CameraPosition(
  //       target: LatLng(double.parse(ordersModel.addressLat!),
  //           double.parse(ordersModel.addressLong!)),
  //       zoom: 12.4746,
  //     );
  //     markers.add(Marker(
  //         markerId: MarkerId("1"),
  //         position: LatLng(double.parse(ordersModel.addressLat!),
  //             double.parse(ordersModel.addressLong!))));
  //   }
  // }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordermodel'];
    print(ordersModel.ordersStatuse);
    // intialData();
    getData();
    super.onInit();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await ordersDetailsData.getData(ordersModel.ordersId!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => CartModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
