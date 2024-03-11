import 'package:adminappn/core/class/curd.dart';
import 'package:adminappn/linkapi.dart';

class VerifyCodeForgetPassWordData {
  Curd crud;
  VerifyCodeForgetPassWordData(this.crud);

  postData(String email, String veryfiycode) async {
    var response = await crud.postData(AppLink.verifycode1forgetpassword, {
      "email": email,
      "veryfiycode": veryfiycode,
    });
    return response.fold((l) => l, (r) => r); //لانها ترجع نوعين
  }
}
