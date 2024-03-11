import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormFiledGlobal extends StatelessWidget {
  final String hintText;
  final TextInputType? keyboardType;
  final Icon icon;
  final String? Function(String?)? validator;
  final TextEditingController? mycontroller;
  final int? index;
  final bool? obscureText;
  void Function()? onPressed;

  CustomTextFormFiledGlobal({
    super.key,
    required this.hintText,
    required this.keyboardType,
    required this.icon,
    required this.validator,
    required this.mycontroller,
    this.index,
    this.obscureText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: 340,
      child: TextFormField(
        obscureText:
            (obscureText == null || obscureText == false || index == null)
                ? false
                : true,
        validator: validator,
        controller: mycontroller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: icon,
            suffixIcon: index == 1
                ? IconButton(
                    icon: const Icon(Icons.remove_red_eye_outlined),
                    onPressed: onPressed,
                  )
                : null),
      ),
    );
  }
}
