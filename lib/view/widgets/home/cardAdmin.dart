import 'package:flutter/material.dart';

class CardAdmin extends StatelessWidget {
  final String name;
  final String image;
  final void Function()? onTap;
  const CardAdmin(
      {super.key,
      required this.name,
      required this.onTap,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: Colors.yellow,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 120,
              height: 80,
            ),
            Text(
              name,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
