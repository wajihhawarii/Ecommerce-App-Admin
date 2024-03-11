import "package:flutter/material.dart";
import "../../../core/constant/color.dart";

// ignore: must_be_immutable
class CustomMaterailButton extends StatelessWidget {
  final Color buttoncolor;
  final String buttonname;
  final double? buttonpositionright;
  final double? buttonpositionleft;

  final void Function()? onpressed;

  const CustomMaterailButton(
      {super.key,
      required this.buttoncolor,
      required this.buttonname,
       this.buttonpositionright,
      required this.onpressed,
      this.buttonpositionleft});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        right: buttonpositionright,
        left: buttonpositionleft,
        child: MaterialButton(
          minWidth: 150,
          height: 40,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: buttoncolor,
          onPressed: onpressed,
          child: Text(
            buttonname,
            style: const TextStyle(color: AppColor.white),
          ),
        ));
  }
}
