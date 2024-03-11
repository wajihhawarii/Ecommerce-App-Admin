import "dart:convert";
import "dart:io";
import "package:dartz/dartz.dart";
import "package:adminappn/core/class/statuserequest.dart";
import "package:adminappn/core/function/cheakeinternet.dart";
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import "package:path/path.dart";

String _basicAuth =
    "Basic${base64Encode(utf8.encode("dddd:sdfsdfsdfsdfsdf"))}"; //يجب ان يكون رقم فريد من اجل الحماية

Map<String, String> _myheaders = {
  'authorization': _basicAuth,
};

class Curd {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    try {
      if (await cheakeInternet()) {
        var response = await http.post(Uri.parse(linkurl), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailuer);
        }
      } else {
        return const Left(StatusRequest.offlinefailuer);
      }
    } catch (_) {
      return const Left(StatusRequest.serverException);
    }
  }

  Future<Either<StatusRequest, Map>> addRequestWithImageOne(
      url, data, File? image,
      [String? namerequest]) async {
    if (namerequest == null) {
      namerequest = "files";
    }

    var uri = Uri.parse(url);
    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll(_myheaders);

    if (image != null) {
      var length = await image.length();
      var stream = http.ByteStream(image.openRead());
      stream.cast();
      var multipartFile = http.MultipartFile(namerequest, stream, length,
          filename: basename(image.path));
      request.files.add(multipartFile);
    }

    // add Data to request
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    // add Data to request
    // Send Request
    var myrequest = await request.send();
    // For get Response Body
    var response = await http.Response.fromStream(myrequest);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      Map responsebody = jsonDecode(response.body);
      return Right(responsebody);
    } else {
      return const Left(StatusRequest.serverfailuer);
    }
  }
}
