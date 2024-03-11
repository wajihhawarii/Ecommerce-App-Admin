import 'package:adminappn/core/middleware/middleware.dart';
import 'package:adminappn/view/screens/auth/loginpage.dart';
import 'package:adminappn/view/screens/categories/add.dart';
import 'package:adminappn/view/screens/categories/edite.dart';
import 'package:adminappn/view/screens/categories/view.dart';
import 'package:adminappn/view/screens/forgetpassword/forgetpassword.dart';
import 'package:adminappn/view/screens/forgetpassword/resetpassword.dart';
import 'package:adminappn/view/screens/forgetpassword/success_resetpassword.dart';
import 'package:adminappn/view/screens/forgetpassword/verifycode.dart';
import 'package:adminappn/view/screens/home/home.dart';
import 'package:adminappn/view/screens/items/add.dart';
import 'package:adminappn/view/screens/items/edite.dart';
import 'package:adminappn/view/screens/items/view.dart';
import 'package:adminappn/view/screens/orders/home.dart';
import 'package:adminappn/view/screens/orders/orderscreen.dart';
import 'package:adminappn/view/screens/orders/detailes.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'core/constant/route.dart';

//,middlewares: [ MiddleWare()]
List<GetPage<dynamic>> routes = [
  GetPage(
      name: "/", page: () => const HomeScreen(), middlewares: [MiddleWare()]),
  GetPage(name: AppRoute.orderpage, page: () => const OrderScreen()),
  GetPage(name: AppRoute.loginpage, page: () => const LoginPage()),

  //VerfiyCodeSignUp//

  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(
      name: AppRoute.verfiyCoderesetpassword,
      page: () => const VerfiyCodeResetPassWord()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetPassword,
      page: () => const SuccessResetPassword()),

//orders
  // GetPage(name: AppRoute.orderspending, page: () => const PendingsOrders()),
  //GetPage(name: AppRoute.ordersarchive, page: () => const ArchiveOrders()),
  GetPage(name: AppRoute.orderdetailes, page: () => const OrderDetailes()),
  GetPage(name: AppRoute.orderdetailes, page: () => const OrderDetailes()),
  GetPage(name: AppRoute.homeorder, page: () => const HomeOrders()),

//categories

  GetPage(name: AppRoute.categoriesview, page: () => const CategoriesView()),
  GetPage(name: AppRoute.categoriesadd, page: () => const CategoriesAdd()),
  GetPage(name: AppRoute.categoriesedit, page: () => const CategoriesEdit()),

  //items
  GetPage(name: AppRoute.itemsview, page: () => const ItemsView()),
  GetPage(name: AppRoute.itemsadd, page: () => const ItemsAdd()),
  GetPage(name: AppRoute.itemsedit, page: () => const ItemsEdit()),
];
