import 'package:adminappn/controller/forgetpassword/resetpassword_controller.dart';
import 'package:adminappn/core/function/valiadinput.dart';
import 'package:adminappn/view/widgets/auth/customtextbodyauth.dart';
import 'package:adminappn/view/widgets/auth/customtextformauth.dart';
import 'package:adminappn/view/widgets/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/class/hundlingdata.dart';
import '../../../core/constant/color.dart';
import '../../widgets/auth/custombuttonauth copy.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPassWordControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.purpule,
          elevation: 0.0,
          title: Text('Reset Password',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: AppColor.white, fontSize: 40)),
        ),
        body: GetBuilder<ResetPassWordControllerImp>(
          builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest!,
              widget: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Form(
                  key: controller.formstate,
                  child: ListView(children: [
                    const SizedBox(height: 20),
                    const CustomTextTitleAuth(text: "New PassWord"),
                    const SizedBox(height: 10),
                    const CustomTextBodyAuth(text: "Pleace Enter New PassWord"),
                    const SizedBox(height: 15),
                    CustomTextFormAuth(
                      isNumber: true,
                      valid: (val) {
                        return validInput(val!, 5, 100, "password");
                      },
                      mycontroller: controller.password,
                      hinttext: 'Enter Your password',
                      iconData: Icons.lock,
                      labeltext: 'password',
                    ),
                    CustomTextFormAuth(
                      isNumber: true,
                      valid: (val) {
                        return validInput(val!, 5, 100, "password");
                      },
                      mycontroller: controller.repassword,
                      hinttext: 'ReEnter Your password',
                      iconData: Icons.lock,
                      labeltext: 'password',
                    ),
                    CustomButtomAuth(
                        text: "save",
                        onPressed: () {
                          controller.goToSuccessResetPassword();
                        }),
                    const SizedBox(height: 40),
                  ]),
                ),
              )),
        ));
  }
}
