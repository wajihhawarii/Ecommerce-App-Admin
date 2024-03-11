import 'package:adminappn/core/constant/route.dart';
import 'package:get/get.dart';

abstract class SuccsessResetPasswordController extends GetxController {
  goToPageLogin();
}

class SuccsessResetPasswordControllerImp
    extends SuccsessResetPasswordController {
  @override
  goToPageLogin() {
    Get.offAllNamed(AppRoute.loginpage);
  }
}
