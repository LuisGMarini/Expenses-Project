import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';

class AdaptativeTextField extends StatelessWidget {
  final String label;
  TextInputType keyboardType = TextInputType.text;
  final TextEditingController controller;
  final Function(String) onSubmitted;

  AdaptativeTextField(
      {required this.controller,
        required this.keyboardType ,
        required this.onSubmitted,
        required this.label}
        );

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: CupertinoTextField(
        controller: controller,
        keyboardType: keyboardType,
        onSubmitted: onSubmitted,
        placeholder: label,
        padding: EdgeInsets.symmetric(
          horizontal: 6,
          vertical: 12,
        ),
      ),
    )
        : TextField(
      controller: controller,
      keyboardType: keyboardType,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
          labelText: label),
    );
  }
}
