import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:image_picker/image_picker.dart';

imageUpLoadCammera() async {
  final PickedFile? file = await ImagePicker().getImage(
      source: ImageSource.camera,
      imageQuality:
          90); //يجب ان نكون واضعين في ملف  منيفست السماحيات تبعيت الكاميرا

  if (file != null) {
    return File(file.path);
  } else {
    return null;
  }
}

showBottomMenu(Function() fromCamera, Function() fromGallery) {
  return Get.bottomSheet(BottomSheet(
      onClosing: () {},
      builder: (context) {
        return Container(
          height: 200,
          color: Colors.red,
          child: ListView(
            children: [
              ListTile(
                title: const Text(
                  "Form Camera",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                onTap: () {
                  fromCamera();
                },
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                title: const Text(
                  "Form Gallery",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                onTap: () {
                  fromGallery();
                },
              ),
            ],
          ),
        );
      }));
}

fileUploadGallery([isSvg = false]) async {
  FilePickerResult? resulte = await FilePicker.platform.pickFiles(
    type: FileType.custom, //اي يمكن ان نختار اي نوع من الملفات
    allowedExtensions: //انواع اللواحق المسموحة بالاضافة
        isSvg ? ["svg", "SVG"] : ["png", "PNG", "jpg", "JPg", "gif", "GIF"],
  );

  if (resulte != null) {
    print("1111111111111111111111111111");
    print(resulte);
    print("1111111111111111111111111111");
    return File(resulte.files.single.path!);
  } else {
    return null;
  }
}
