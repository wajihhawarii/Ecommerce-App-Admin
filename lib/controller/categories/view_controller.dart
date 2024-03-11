import 'package:adminappn/core/class/statuserequest.dart';
import 'package:adminappn/core/constant/route.dart';
import 'package:adminappn/core/function/hundlingdata.dart';
import 'package:adminappn/core/services/myservices.dart';
import 'package:adminappn/data/datasourse/remote/categories_date.dart';
import 'package:adminappn/data/model/categoriesmodel.dart';
import 'package:get/get.dart';

abstract class ViewCategoriesController extends GetxController {
  getCategories();
  deleteCategories(String id, String imagename);
  deleteCategories2(String id, String imagename);
  goToCategoriesPageEdit(CategoriesModel categoriesModel);
}

class ViewCategorisControllerImp extends ViewCategoriesController {
  List<CategoriesModel> data = [];

  CategoriesData categoriesData = CategoriesData(Get.find());

  StatusRequest? statusRequest;

  MyServices myServices = MyServices();

  @override
  getCategories() async {
    statusRequest = StatusRequest.loading;
    data.clear();
    var response = await categoriesData.getCategories();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List datalist = response['data'];
        print("11111111111111111111111111111111");
        print(datalist);
        print("111111111111111111111111111111111111");
        data.addAll(datalist.map((e) => CategoriesModel.fromJson(e)));
      } else {
        print('222222222222222222222222222222');
      }
    } else {
      print("333333333333333333333333333333");
    }
    update();
  }

//طريفة ثانية للحذف وبالتالي  هذه الطريقة توفر ريكويست ع سيرف وتحسن الاداء وبالتالي هي الافضل
  @override
  deleteCategories2(String id, String imagename) {
    categoriesData.deleteCategorie({
      "id": id,
      "imagename": imagename,
    });
    data.removeWhere((element) => element.categoriesId == id);
    update();
  }

//طريقة اولى للحذف صية لكن يوجد طريقة اسرع  وهي الطريقة التي فوقها
  @override
  deleteCategories(String id, String imagename) async {
    statusRequest = StatusRequest.loading;
    var response = await categoriesData.deleteCategorie({
      "id": id,
      "imagename": imagename,
    });
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.snackbar("The Process is success", " The Categories is delete");
        getCategories();
      } else {}
    } else {}
    update();
  }

  @override
  goToCategoriesPageEdit(CategoriesModel categoriesModel) {
    Get.toNamed(AppRoute.categoriesedit, arguments: {
      "categoriesModel": categoriesModel,
    });
  }

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }
}
