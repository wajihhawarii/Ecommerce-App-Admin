import 'package:flutter/material.dart';
import '../../../core/class/clippath.dart';


class CustomClipPathFirstPage extends StatelessWidget {
  const CustomClipPathFirstPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ClipperFirstPage(),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.black54,
                Colors.black54,
                Colors.black87,
                Colors.black,
              ]),
        ),
        height: 600,
        width: double.infinity,
      ),
    );
  }
}
