import 'package:flutter/material.dart';
import '../../../core/class/clippath.dart';
import '../../../core/constant/color.dart';

class CustomClipPathBottomLogin extends StatelessWidget {
  final void Function()? onPressed;
  const CustomClipPathBottomLogin({super.key,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ClipperBottomLogin(),
      child: Container(
        height: 132,
        decoration: const BoxDecoration(
         color: AppColor.purpule,
          // color: Colors.black
        ),
        child: Center(
          child: TextButton(
            onPressed: onPressed,
            child: RichText(
                text: const TextSpan(children: [
              TextSpan(
                  text: "Are Youe haven't any Account ?\n",
                  style: TextStyle(color: Colors.white, fontSize: 15)),
              TextSpan(
                  text: "Click Here..",
                  style: TextStyle(color: AppColor.blue, fontSize: 16)),
            ])),
          ),
        ),
      ),
    );
  }
}
