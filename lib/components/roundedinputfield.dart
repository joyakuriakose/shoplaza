
import 'package:flutter/material.dart';
import 'package:shoplaza/components/textfieldcontainer.dart';
class RoundedInputField extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const RoundedInputField({
    Key? key,
    this.icon = Icons.person,
    required this.onChanged, required this.labelText, required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      controller: controller,
      child:
      TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.blueGrey,
          ),
          labelText: labelText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
