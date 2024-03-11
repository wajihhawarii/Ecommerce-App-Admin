import 'package:adminappn/core/constant/color.dart';
import 'package:flutter/material.dart';

import '../../../core/class/clippath.dart';

class CustomClipPathTopLogin extends StatelessWidget {
  const CustomClipPathTopLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ClipperTopLogin(), //هو كلاس مسوول عن اطار الخلفية
      child: Container(
        decoration: const BoxDecoration(
          color: AppColor.purpule,
        ),
        height: 300,
        width: double.infinity,
        child: const Center(
            child: Text(
          "Login \n Inter Your Account ",
          style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        )),
      ),
    );
  }
}
