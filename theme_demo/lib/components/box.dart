import 'package:flutter/material.dart';

class MyBox extends StatelessWidget {
  final Widget? child;
  final Color? color;
  const MyBox({super.key, required this.child, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? Colors.blue,
        borderRadius: BorderRadius.circular(8.0),
      ),
      height: 200,
      width: 200,
      padding: const EdgeInsets.all(50),
      child: child,
    );
  }
}
