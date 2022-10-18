import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final List<TextInputFormatter> formatters;
  const LoginTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.formatters = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        inputFormatters: formatters,
        controller: controller,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        cursorColor: Colors.black,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          hintText: hintText,
          // helperText: 'Email',asd
        ),
      ),
    );
  }
}
