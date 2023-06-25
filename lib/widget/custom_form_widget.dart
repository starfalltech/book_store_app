import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFormWidget extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  final bool obsecure;
  final bool isOpsional;
  final TextInputType? inputType;
  final FormFieldValidator<String>? validation;

  const CustomFormWidget(
      {super.key,
      this.hint,
      this.controller,
      this.validation,
      required this.obsecure,
      this.inputType,
      this.isOpsional = true});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obsecure,
      keyboardType: inputType,
      validator:validation ?? (value) {
        if (value == null || value.isEmpty) {
          if (isOpsional) {
            return 'Please enter some text';
          }
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
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xffE9ECEF),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xffE9ECEF),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
