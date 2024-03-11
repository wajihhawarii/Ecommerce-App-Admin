import 'package:adminappn/view/widgets/auth/custombuttonauth%20copy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/successrestpassword_controller.dart';
import '../../../core/constant/color.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccsessResetPasswordControllerImp controller =
        Get.put(SuccsessResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text('Success',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: AppColor.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
                child: Icon(
              Icons.check_circle_outline,
              size: 200,
              color: AppColor.purpule,
            )),
            const Text("...."),
            const Spacer(),
            SizedBox(
                width: double.infinity,
                child: CustomButtomAuth(
                  text: "Go To Login",
                  onPressed: () {
                    controller.goToPageLogin();
                  },
                )),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
