import 'package:adminappn/core/class/statuserequest.dart';

handlingData(response) {
  if (response is StatusRequest) {
    if (response == StatusRequest.offlinefailuer) {
      return response;
    } else {
      return response;
    }
  } else {
    //من نوع ال ماب اي جلب البيانات بنجاح

    return StatusRequest.success;
  }
}
