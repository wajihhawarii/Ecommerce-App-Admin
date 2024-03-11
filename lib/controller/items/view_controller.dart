import 'package:adminappn/core/class/statuserequest.dart';
import 'package:adminappn/core/constant/route.dart';
import 'package:adminappn/core/function/hundlingdata.dart';
import 'package:adminappn/core/services/myservices.dart';
import 'package:adminappn/data/datasourse/remote/items_data.dart';
import 'package:adminappn/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class ViewitemsController extends GetxController {
  getItems();
  deleteItems2(String id, String imagename);
  deleteItems(String id, String imagename);
  goToItemsPageEdit(ItemsModel itemsModel);
}

class ViewitemsControllerImp extends ViewitemsController {
  List<ItemsModel> data = [];

  ItemsData itemsData = ItemsData(Get.find());

  StatusRequest? statusRequest;

  MyServices myServices = MyServices();

  @override
  getItems() async {
    statusRequest = StatusRequest.loading;
    data.clear();
    var response = await itemsData.getitems();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => ItemsModel.fromJson(e)));
      } else {}
    } else {}
    update();
  }

//طريفة ثانية للحذف وبالتالي  هذه الطريقة توفر ريكويست ع سيرف وتحسن الاداء وبالتالي هي الافضل
  @override
  deleteItems2(String id, String imagename) {
    itemsData.deleteitems({
      "id": id,
      "imagename": imagename,
    });
    data.removeWhere((element) => element.itemsId == id);
    update();
  }

//طريقة اولى للحذف صية لكن يوجد طريقة اسرع  وهي الطريقة التي فوقها
  @override
  deleteItems(String id, String imagename) async {
    statusRequest = StatusRequest.loading;
    var response = await itemsData.deleteitems({
      "id": id,
      "imagename": imagename,
    });
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.snackbar("The Process is success", " The items is delete");
        getItems();
      } else {}
    } else {}
    update();
  }

  @override
  goToItemsPageEdit(ItemsModel itemsModel) {
    Get.toNamed(AppRoute.itemsedit, arguments: {
      "itemsModel": itemsModel,
    });
  }

  @override
  void onInit() {
    getItems();
    super.onInit();
  }
}
