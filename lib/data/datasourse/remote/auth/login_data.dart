import 'package:adminappn/core/class/curd.dart';
import 'package:adminappn/linkapi.dart';

class LoginData {
  Curd curd;
  LoginData(this.curd);
  postData(String email, String password) async {
    var response = await curd.postData(AppLink.login, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
