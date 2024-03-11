import 'package:adminappn/core/class/statuserequest.dart';
import 'package:adminappn/core/constant/route.dart';
import 'package:adminappn/core/function/hundlingdata.dart';
import 'package:adminappn/data/datasourse/remote/forgetpassword%20copy/checkemail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  checkemail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController email;
  StatusRequest? statusRequest = StatusRequest.none;

  GlobalKey<FormState> formstate = GlobalKey();

  CheackEmailData cheackEmailData =
      CheackEmailData(Get.find()); // اخذنا غرض من الكلاس

  @override
  checkemail() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var respons = await cheackEmailData.postData(email.text);
      statusRequest =
          handlingData(respons); //عبارة عن دالة تتعامل مع القيمة المرجعة
      if (StatusRequest.success == statusRequest) {
        if (respons['status'] == "success") {
          Get.offNamed(AppRoute.verfiyCoderesetpassword, arguments: {
            "email": email.text,
          });
        } else {
          Get.defaultDialog(
            title: "Eroor",
            middleText: "Email Not Found",
          );
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
