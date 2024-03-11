import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "Not Valid UserName";
    }
  } else if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "Not Found Email";
    }
  } else if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "Not Found Email";
    }
  }

  if (val.isEmpty) {
    return "Value Can't be Empty";
  }
  if (val.length > max) {
    return "Value Can't be larger than $max";
  }
  if (val.length < min) {
    return "Value Can't be Smaller than $min";
  }
}
