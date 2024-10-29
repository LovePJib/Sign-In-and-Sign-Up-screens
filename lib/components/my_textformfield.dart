// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.labelText,
    required this.hintText,
  });

  final TextEditingController controller;
  final bool obscureText;
  final String labelText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
                controller: controller,
                obscureText: obscureText,
                decoration: InputDecoration(
                  label: Text(labelText),
                  hintText: hintText,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                    gapPadding: 10,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.blue),
                    gapPadding: 10,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
    );
              
  }
}
