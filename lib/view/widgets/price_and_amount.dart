import 'package:flutter/material.dart';

class PriceAndAmount extends StatelessWidget {
  final String price;
  final String amount;
  final void Function()? onAdd;
  final void Function()? onRemove;

  const PriceAndAmount(
      {super.key,
      required this.price,
      required this.amount,
      this.onAdd,
      this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          price,
          style: const TextStyle(fontSize: 20, color: Colors.red),
        ),
        const Spacer(),
        IconButton(onPressed: onAdd, icon: const Icon(Icons.add)),
        Container(
          width: 30,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            amount,
            style: const TextStyle(fontSize: 20),
          ),
        ),
        IconButton(onPressed: onRemove, icon: const Icon(Icons.remove)),
      ],
    );
  }
}
