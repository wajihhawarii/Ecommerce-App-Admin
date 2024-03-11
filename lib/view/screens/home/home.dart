import 'package:adminappn/core/constant/image.dart';
import 'package:adminappn/core/constant/route.dart';
import 'package:adminappn/view/widgets/home/cardAdmin.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.red, title: const Text("Home")),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: ListView(
            children: [
              GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: getValueForScreenType<int>(
                        context: context,
                        mobile: 2,
                        tablet: 4,
                        desktop: 5,
                      ),
                      mainAxisExtent: 160),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    CardAdmin(
                        name: "Categories",
                        onTap: () {
                          Get.toNamed(AppRoute.categoriesview);
                        },
                        image: AppImage.user),
                    CardAdmin(
                        name: "Items",
                        onTap: () {
                          Get.toNamed(AppRoute.itemsview);
                        },
                        image: AppImage.user),
                    CardAdmin(
                        name: "Users", onTap: () {}, image: AppImage.user),
                    CardAdmin(
                        name: "Orders",
                        onTap: () {
                          Get.toNamed(AppRoute.homeorder);
                        },
                        image: AppImage.user),
                    CardAdmin(
                        name: "Reports", onTap: () {}, image: AppImage.user),
                    CardAdmin(
                        name: "Notifications",
                        onTap: () {},
                        image: AppImage.user),
                  ])
            ],
          ),
        ));
  }
}
