import 'package:adminappn/core/class/statuserequest.dart';
import 'package:adminappn/core/function/hundlingdata.dart';
import 'package:adminappn/data/datasourse/remote/forgetpassword%20copy/resetpassword.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/constant/route.dart';

abstract class ResetPassWordController extends GetxController {
  resetPassword();
  goToSuccessResetPassword();
}

class ResetPassWordControllerImp extends ResetPassWordController {
  late TextEditingController password;
  late TextEditingController repassword;
  String? email;

  StatusRequest? statusRequest =
      StatusRequest.none; //اعطينا قيمة من اجل ان لايظهر غلط فبي صفحة login
  ResetPassWordData resetPassWordData = ResetPassWordData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey();

  @override
  goToSuccessResetPassword() async {
    if (password.text != repassword.text) {
      return Get.defaultDialog(
          title: "Eroor", middleText: "password Not Match ");
    }
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var respons = await resetPassWordData.postData(email!, password.text);
      statusRequest =
          handlingData(respons); //عبارة عن دالة تتعامل مع القيمة المرجعة
      print("lllllllllllllllllllllllll");
      Get.offNamed(AppRoute.successResetPassword);
      if (StatusRequest.success == statusRequest) {
        print("zzzzzzzzzzzzzzzzzzzzzzzzzzz");
        if (respons['status'] == "success") {
          //  data.addAll(respons['data']);  //
          //print       را جع اخر الفدية 42
          print("6666666666666666666666666666");
          Get.offNamed(AppRoute.successResetPassword);
        } else {
          Get.defaultDialog(
            title: "Eroor",
            middleText: "Try Again",
          );
          statusRequest = StatusRequest.failure; //لا يوجد بيانات
        }
      }
      update();
    }
  }

  @override
  resetPassword() {}

  @override
  void onInit() {
    print("111111111111111111111");
    password = TextEditingController();
    repassword = TextEditingController();
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    password.dispose();
    repassword.dispose();
  }
}
