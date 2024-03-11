import 'package:adminappn/core/constant/color.dart';
import 'package:flutter/material.dart';
import '../../../core/class/clippath.dart';

class CustomClipPath extends StatelessWidget {
  const CustomClipPath({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ClipperSignUp(),
      child: Container(
        decoration: const BoxDecoration(color: AppColor.purpule),
        height: 300,
        width: double.infinity,
        child: const Center(
            child: Text(
          "SignUp \n Create Your Account ",
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
