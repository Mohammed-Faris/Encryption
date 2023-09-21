import 'package:flutter/material.dart';
import 'package:storagesecure/constants/constant.dart';

class TextFormFieldbldr extends StatelessWidget {
  const TextFormFieldbldr({super.key, required this.textEditingController});

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(5.5),
        ),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue)),
        prefixIcon: const Icon(
          Icons.lock,
          color: Colors.blue,
        ),
        filled: true,
        fillColor: primaryColor.withOpacity(0.1),
        labelText: 'Enter Data',
        labelStyle: const TextStyle(color: Colors.blue),
      ),
    );
  }
}
