import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

import '../../controller/orders/pending_controller.dart';

requestPermissionNotification() async {
  // ignore: unused_local_variable
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    //ملف السماحيات  منجيبو متل ما هوي مو موقع الفايربيز
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmconfig() {
  //تتعامل مع الرسالة الواردة عندما يكون التطبيق مفتوح
  print("hai =======================================================");
  FirebaseMessaging.onMessage.listen((message) {
    print("================== Notification =================");
    print(message.notification!.title); //طباعة عنوان الرسالة المستلمة
    print(message.notification!.body); //طباعة جسم الرسالة المستلمة
    FlutterRingtonePlayer.playNotification(); //من اجل اظهار الصوت
    Get.snackbar(message.notification!.title!, message.notification!.body!);
    refreshPageNotification(message.data);
  });
}

refreshPageNotification(data) {
  print(
      "=============================================================================== ");
  print(data['pageid']);
  print(
      "=============================================================================== ");
  print(data['pagename']);
  print(
      "================================================================================ ");

  print(Get.currentRoute);
  print("#####################################");
  if (Get.currentRoute == "/orderspending" && data['pagename'] == "order") {
    print(
        "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
    PendingsControllerImp controller = Get.find(); //  لانها تكون محقونة حتما
    controller.refrehOrder();
  }
}

//Real Time  من اجل شي 

//1- firebasse + stream 
//2- soket io  +   NotJS
//3- notification refreach 