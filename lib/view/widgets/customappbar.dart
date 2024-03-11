import 'package:adminappn/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomAppBar1 extends StatelessWidget {
  final String titleappbar;
  final void Function(String)? onChanged;
  final void Function()? onPressedIconFavorite;
  final TextEditingController? mycontroller;
  final void Function()? onPressedserach;
  const CustomAppBar1({
    super.key,
    required this.titleappbar,
    required this.onPressedserach,
    required this.onPressedIconFavorite,
    required this.onChanged,
    required this.mycontroller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(children: [
        Expanded(
            child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey,
          ),
          child: TextFormField(
            onChanged: onChanged, //عند الكتابة بداخل الحقل النصي
            controller: mycontroller,
            decoration: InputDecoration(
                prefixIcon: IconButton(
                    icon: const Icon(Icons.search), onPressed: onPressedserach),
                hintText: titleappbar,
                hintStyle: const TextStyle(fontSize: 18),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.grey[200]),
          ),
        )),
        const SizedBox(width: 20),
        Container(
          decoration: BoxDecoration(
              border: Border.all(width: 2, color: AppColor.purpule),
              color: Colors.white70,
              borderRadius: BorderRadius.circular(10)),
          width: 60,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: IconButton(
              onPressed: onPressedIconFavorite,
              icon: const Icon(
                Icons.favorite,
                size: 30,
                color: Colors.red,
              )),
        ),
      ]),
    );
  }
}
