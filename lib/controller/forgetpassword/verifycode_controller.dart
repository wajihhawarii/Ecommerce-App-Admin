import 'package:adminappn/core/class/statuserequest.dart';
import 'package:adminappn/core/constant/route.dart';
import 'package:adminappn/core/function/hundlingdata.dart';
import 'package:adminappn/data/datasourse/remote/forgetpassword%20copy/verifycode.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode();
  goToResetPassword(String verifyCode);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  String? email;
  StatusRequest? statusRequest = StatusRequest.none;
  VerifyCodeForgetPassWordData verifyCodeForgetPassWordData =
      VerifyCodeForgetPassWordData(Get.find());

  @override
  checkCode() {}

  @override
  goToResetPassword(String verifyCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var respons =
        await verifyCodeForgetPassWordData.postData(email!, verifyCode);
    print(respons);
    statusRequest =
        handlingData(respons); //عبارة عن دالة تتعامل مع القيمة المرجعة
    print("1111111111111111111111111111111111111111");
    print(statusRequest);
    print("111111111111111111111111111111111111");
    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        print("111111111111111111");
        Get.toNamed(AppRoute.resetPassword, arguments: {"email": email});
      } else {
        Get.defaultDialog(
          title: "Eroor",
          middleText: "The code is Eroor",
        );
        statusRequest = StatusRequest.failure; //لا يوجد بيانات
      }
    }
    print("11111111111111111111111111111111111111111");
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
