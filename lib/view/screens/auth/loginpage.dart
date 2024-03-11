import 'package:adminappn/core/class/hundlingdata.dart';
import 'package:adminappn/core/constant/color.dart';
import "package:flutter/material.dart";
import "package:get/get.dart";
import '../../../controller/auth/login_controller.dart';
import '../../../core/function/valiadinput.dart';
import '../../widgets/auth/custom_clippath_bottom_login.dart';
import '../../widgets/auth/custom_clippath_top_login.dart';
import '../../widgets/auth/custom_textformfiled.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp loginControllerImp = Get.put(LoginControllerImp());
    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<LoginControllerImp>(builder: (controller) {
          return HandlingDataRequest(
              statusRequest: controller.statusRequest!,
              widget: ListView(children: [
                const CustomClipPathTopLogin(),
                SizedBox(
                    child: Form(
                  key: loginControllerImp.formstate,
                  child: Column(children: [
                    CustomTextFormFiled(
                      mycontroller: loginControllerImp.email,
                      validator: (val) {
                        return validInput(val!, 5, 100, "email");
                      },
                      hintText: " pleace Enter Your Email ",
                      icon: const Icon(Icons.email),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    CustomTextFormFiled(
                      obscureText: loginControllerImp.isshaowpassword,
                      onPressed: () {
                        loginControllerImp.showPassword();
                      },
                      index: 1,
                      mycontroller: loginControllerImp.password,
                      validator: (val) {
                        return validInput(val!, 5, 50, "password");
                      },
                      hintText: " pleace Enter Your password ",
                      icon: const Icon(Icons.lock_open_sharp),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            controller.goToForgetPassword();
                          },
                          child: const Text(
                            "ForgePassWord",
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.green),
                          ),
                        )
                      ],
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      color: AppColor.purpule,
                      minWidth: 150,
                      height: 37,
                      onPressed: () {
                        loginControllerImp.login();
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    const Text(
                      "Login to your account to get  \n all your saved data",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    CustomClipPathBottomLogin(
                      onPressed: () {
                        // loginControllerImp.signUp();
                      },
                    ),
                  ]),
                ))
              ]));
        }));
  }
}
