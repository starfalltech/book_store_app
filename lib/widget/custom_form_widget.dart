import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFormWidget extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  final bool obsecure;

  const CustomFormWidget(
      {super.key, this.hint, this.controller, required this.obsecure});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obsecure,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      decoration: InputDecoration(
        hintStyle: GoogleFonts.urbanist(
          color: const Color(0xffB5B6B8),
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        contentPadding: const EdgeInsets.only(top: 16, bottom: 16, left: 20),
        isDense: true,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
