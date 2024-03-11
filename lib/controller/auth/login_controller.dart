import 'package:adminappn/core/class/statuserequest.dart';
import 'package:adminappn/core/constant/color.dart';
import 'package:adminappn/core/services/myservices.dart';
import 'package:adminappn/data/datasourse/remote/auth/login_data.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import '../../core/constant/route.dart';
import '../../core/function/hundlingdata.dart';

abstract class LoginController extends GetxController {
  login();
  goToForgetPassword();
  showPassword();
}

class LoginControllerImp extends LoginController {
  LoginData loginData = LoginData(Get.find());
  TextEditingController? email;
  TextEditingController? password;
  StatusRequest? statusRequest = StatusRequest.none;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool isshaowpassword = true;

  MyServices myServices = Get.find();
  @override
  login() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      print("0000000000000000000000000000000");
      var response = await loginData.postData(email!.text, password!.text);
      print("22222222222222222222222$response");
      statusRequest =
          handlingData(response); //عبارة عن دالة تتعامل مع القيمة المرجعة
      print("333333333333333333333333333333333");
      print(statusRequest);
      print("44444444444444444444444444444444");
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          myServices.sharedPreferences
              .setString("id", response['data']['delivery_id']);
          // ignore: unused_local_variable
          String deliveryid = myServices.sharedPreferences.getString("id")!;
          myServices.sharedPreferences
              .setString("username", response['data']['delivery_name']);
          myServices.sharedPreferences
              .setString("email", response['data']['delivery_email']);
          myServices.sharedPreferences
              .setString("phone", response['data']['delivery_phone']);
          myServices.sharedPreferences.setString("step", "2");
          FirebaseMessaging.instance.subscribeToTopic("delivery");
          FirebaseMessaging.instance.subscribeToTopic("delivery$deliveryid");
          print("111111111111111111111111111111111111");
          Get.offNamed(AppRoute.homescreen);
        } else {
          Get.defaultDialog(
            title: "Error",
            content: const Text(
              "Email Or PassWord NotFound",
              style: TextStyle(color: AppColor.white),
            ),
            titleStyle:
                const TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
            backgroundColor: Colors.red[900],
          );
          statusRequest = StatusRequest.failure;
          update();
        }
        print("2222222222222222222222222222222222");
      }
      print("33333333333333333333333333");
    }
  }

  @override
  void onInit() {
    super.onInit();
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  goToForgetPassword() {
    Get.offNamed(AppRoute.forgetPassword);
    throw UnimplementedError();
  }

  @override
  showPassword() {
    isshaowpassword = isshaowpassword == true ? false : true;
    update(); //من اجل ان يتم التعديل في واجهة المستخدم
  }

  @override
  void dispose() {
    //انتبه لاتنفذ الا عند الانتقال بشك نهاىي الي صفحة اخرى اما اذا اضفت صفحة فوقها لن تنفذ وسوف يعطي مشاكل
    super.dispose();
    email!.dispose();
    password!.dispose();
  }
}
