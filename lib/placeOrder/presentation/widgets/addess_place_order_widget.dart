import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../widget/custom_form_widget.dart';

class AddessPlaceOrderWidget extends StatefulWidget {
  final PageController controller;
  const AddessPlaceOrderWidget({super.key, required this.controller, });

  @override
  State<AddessPlaceOrderWidget> createState() => _AddessPlaceOrderWidgetState();
}

class _AddessPlaceOrderWidgetState extends State<AddessPlaceOrderWidget> {
  final address = TextEditingController();
  final state = TextEditingController();
  final city = TextEditingController();
  final postalCode = TextEditingController();

  final _formKeyAddress = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h-85,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Form(
          key: _formKeyAddress,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Address",
                style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: const Color(0xff0B090A)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Add shipping details.",
                style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: const Color(0xff848588)),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomFormWidget(
                controller: address,
                hint: "Address",
                obsecure: false,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomFormWidget(
                controller: state,
                hint: "State",
                obsecure: false,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomFormWidget(
                controller: address,
                hint: "City",
                obsecure: false,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomFormWidget(
                controller: address,
                hint: "Postal Code",
                obsecure: false,
              ),
              const Spacer(),
              ElevatedButton(
                  onPressed: () {
                    widget.controller.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.ease);
                  },
                  child: Text(
                    "Continue",
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w700, fontSize: 18),
                  )),
              const SizedBox(
                height: 34,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
