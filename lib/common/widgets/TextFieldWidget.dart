import 'package:flutter/material.dart';

class TextFieldWidget {
  final String value;
  final TextFormField textFormField;
  final String? hintText;

  TextFieldWidget({required this.value, this.hintText})
      : textFormField = TextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter some $value';
      }
      return null;
    },

    decoration: InputDecoration(
      labelText: '$value',
      hintText: hintText,
      filled: true,
      fillColor: Colors.grey,
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(color: Colors.grey),
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(color: Colors.grey),
      ),
    ),
  );
}
