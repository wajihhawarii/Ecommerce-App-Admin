import 'dart:io';

cheakeInternet() async {
  try {
    var resulte = await InternetAddress.lookup("google.com");
    if (resulte.isNotEmpty && resulte[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
}
