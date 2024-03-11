// import "package:flutter/material.dart";
// import "package:flutter_rating_bar/flutter_rating_bar.dart";
// import "package:get/get.dart";
// import "../../controller/orders/archive_controller.dart";

// // ignore: must_be_immutable
// class RatingBar1 extends GetView<ArchiveControllerIm> {
//   double rating = 0;
//   String? orderid;

//   RatingBar1({super.key, required this.orderid});

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController? note = TextEditingController();
//     return AlertDialog(
//         backgroundColor: Colors.brown,
//         actions: [
//             MaterialButton(
//               color: Colors.blue,
//               onPressed: () {
//                 controller.submitRating(orderid!, rating, note.text);
//               },
//               child: const Text("SubMit",
//                   style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white))),
//           MaterialButton(
//               color: Colors.blue,
//               onPressed: () {
//                 Get.back();
//               },
//               child: const Text("Cansel",
//                   style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white))),
//         ],
//         title: const Text(
//           "Rating Your Order",
//           style: TextStyle(
//               color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//               padding: const EdgeInsets.all(5),
//               height: 100,
//               width: 240,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: Colors.red[900]),
//               child: Center(
//                 child: RatingBar.builder(
//                   itemCount: 5,
//                   initialRating: 0,
//                   allowHalfRating: true,
//                   direction: Axis.horizontal,
//                   itemBuilder: (context, index) {
//                     return const Icon(
//                       Icons.star,
//                       color: Colors.blue,
//                       size: 10,
//                     );
//                   },
//                   onRatingUpdate: (value) {
//                     rating = value;
//                   },
//                 ),
//               ),
//             ),
//             TextFormField(
//               controller: note,
//               decoration: const InputDecoration(
//                   hintText: "Add Yore Note",
//                   hintStyle: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                       fontStyle: FontStyle.italic)),
//             ),
//           ],
//         ));
//   }
// }
