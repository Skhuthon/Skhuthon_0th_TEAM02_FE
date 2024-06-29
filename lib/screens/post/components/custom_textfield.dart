import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final int? minLines;
  final int? maxLines;
  final Function(String) onChanged;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.onChanged,
    this.hintText,
    this.minLines,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      minLines: minLines ?? 1,
      maxLines: maxLines ?? 1,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '내용을 입력해 주세요';
        }
        return null;
      },
      onChanged: (value) => onChanged(value),
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
