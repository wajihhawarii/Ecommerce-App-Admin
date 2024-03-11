import 'package:adminappn/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonAppBarScreenHome extends StatelessWidget {
  final void Function()? onPressed;
  final String textbutton;
  final IconData icondata;
  final bool? active;
  const CustomButtonAppBarScreenHome({
    super.key,
    required this.onPressed,
    required this.textbutton,
    required this.icondata,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icondata,
            size: 16,
            color: active == true ? Colors.yellow[500] : AppColor.white,
          ),
          Text(textbutton,
              style: TextStyle(
                  fontSize: 12,
                  color: active == true ? Colors.yellow[500] : AppColor.white)),
        ],
      ),
    );
  }
}
