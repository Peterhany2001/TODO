import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  String? hintText;
  late TextEditingController controller ;

  MyTextField({this.hintText,required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText
      ),
    );
  }
}
