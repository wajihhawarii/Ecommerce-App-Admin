import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final String? Function(String?)? valid;
  final bool isNumber;
  final bool ?obscureText;
  final void Function()? onTap;

  const CustomTextFormAuth({
    Key? key,
    this.onTap,
    this.obscureText,
    required this.hinttext,
    required this.labeltext,
    required this.iconData,
    required this.mycontroller,
    required this.valid,
    required this.isNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: TextFormField(
          obscureText: obscureText==null ||obscureText == false ?false:true,
          keyboardType: isNumber
              ? const TextInputType.numberWithOptions(decimal: true)
              : TextInputType.text,
          validator: valid,
          controller: mycontroller,
          decoration: InputDecoration(
              hintText: hinttext,
              hintStyle: const TextStyle(fontSize: 14),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              label: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 9),
                  child: Text(labeltext)),
              suffixIcon: InkWell(
                onTap:onTap ,
                child: Icon(iconData),
                ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
        ),
      ),
    );
  }
}
