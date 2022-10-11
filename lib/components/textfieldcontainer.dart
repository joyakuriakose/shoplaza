import 'package:flutter/material.dart';

import '../constants/constants.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  final Color color;
  final TextEditingController controller;

  const TextFieldContainer({
    Key? key,
    required this.child,
    this.color = kGreenLightColor, required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: size.width * 0.8,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(29),
        ),
        child: child,
      ),
    );
  }
}