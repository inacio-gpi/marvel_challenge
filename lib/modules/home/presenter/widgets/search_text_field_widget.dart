// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class SearchTextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? hintText;
  const SearchTextFieldWidget({
    Key? key,
    this.controller,
    this.onChanged,
    this.hintText,
  }) : super(key: key);
  static final OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: const BorderSide(
      color: Color(0xFF383838),
      width: 0,
    ),
  );
  @override
  Widget build(BuildContext context) => TextField(
        key: key,
        controller: controller,
        onChanged: onChanged,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.white,
          height: 1.5,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFF383838),
          hintText: hintText ?? '',
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.white.withOpacity(0.7),
            height: 1.5,
          ),
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          border: border,
          enabledBorder: border,
          focusedBorder: border,
        ),
      );
}
