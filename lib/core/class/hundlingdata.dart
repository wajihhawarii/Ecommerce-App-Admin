import 'package:adminappn/core/class/statuserequest.dart';
import 'package:adminappn/core/constant/image.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: Lottie.asset(AppImage.loding))
        : statusRequest == StatusRequest.offlinefailuer
            ? Center(child: Lottie.asset(AppImage.offline))
            : statusRequest == StatusRequest.serverfailuer
                ? Center(
                    child: Lottie.asset(AppImage.empty),
                  )
                : widget;
  }
}
