import 'package:flutter/material.dart';

class  ClipperFirstPage  extends CustomClipper<Path> {
  var path = Path();
  @override
  Path getClip(Size size) {
    //size of container
    path.lineTo(0, size.height); //الخط الاول
    path.quadraticBezierTo(size.width * 0.22, size.height - 350,
        size.width * 0.6, size.height - 200); //مسولة عن النحنيات

    path.quadraticBezierTo(
        size.width * 0.9, size.height - 100, size.width, size.height - 150);

    path.lineTo(size.width, 0);
    // path.lineTo(110, size.height);//الخط التاني
    //     path.lineTo(size.width, 0);//الخط التالت
    //        path.lineTo(size.width, 0);//الخط التالت

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}



class ClipperTopLogin extends CustomClipper<Path> {
  var path = Path();
  @override
  Path getClip(Size size) {
    //size of container
    path.lineTo(0, size.height - 50); //الخط الاول
    path.quadraticBezierTo(
        size.width * 0.1, size.height - 80, size.width * 0.3, size.height - 60);

    path.quadraticBezierTo(
        size.width * 0.9, size.height, size.width, size.height - 100);

    path.lineTo(size.width, 0); //الخط الاول

    path.lineTo(size.width, 0); //الخط التالت

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}




class ClipperSignUp extends CustomClipper<Path> {
  var path = Path();
  @override
  Path getClip(Size size) {
    //size of container
    path.lineTo(0, size.height - 50); //الخط الاول
    path.quadraticBezierTo(
        size.width * 0.1,
        size.height - 80,
        size.width * 0.3,
        size.height -
            60); // path.quadraticBezierTo(size.width * 0.22, size.height - 350,
    //     size.width * 0.6, size.height - 200); //مسولة عن النحنيات

    path.quadraticBezierTo(
        size.width * 0.9, size.height, size.width, size.height - 100);

    path.lineTo(size.width, 0); //الخط الاول

    // path.quadraticBezierTo(size.width * 0.8, size.height - 220,
    //     size.width * 0.5, size.height - 220);

    // path.quadraticBezierTo(
    //     size.width * 0.2, size.height - 250, 0, size.height - 200);

    //path.lineTo(size.width*0.3, 0);
    // path.lineTo(110, size.height);//الخط التاني
    //     path.lineTo(size.width, 0);//الخط التالت
    //        path.lineTo(size.width, 0);//الخط التالت

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class ClipperBottomLogin extends CustomClipper<Path> {
  var path = Path();

  @override
  Path getClip(Size size) {
    path.lineTo(0, size.height); //الخط الاول
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height - 70);

    path.quadraticBezierTo(size.width * 0.9, size.height - 70, size.width * 0.6,
        size.height - 100);

    path.quadraticBezierTo(
      size.width * 0.3,
      0,
      0,
      size.height - 60,
    );

    path.lineTo(0, size.height - 60);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}