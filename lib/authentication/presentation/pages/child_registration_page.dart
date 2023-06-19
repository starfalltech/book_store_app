import 'package:book_store_app/authentication/presentation/pages/verify_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../widget/custom_appbar_widget.dart';
import '../../../widget/custom_form_widget.dart';

class ChildRegistrationPage extends StatefulWidget {
  final String email;

  const ChildRegistrationPage({super.key, required this.email});

  @override
  State<ChildRegistrationPage> createState() => _ChildRegistrationPageState();
}

class _ChildRegistrationPageState extends State<ChildRegistrationPage> {
  final grade = TextEditingController();
  final childName = TextEditingController();
  final idNumber = TextEditingController();
  final streetAddress = TextEditingController();
  final unitNumber = TextEditingController();
  final complex = TextEditingController();
  final postalCode = TextEditingController();
  ValueNotifier<int> gender = ValueNotifier(0);
  ValueNotifier<int> city = ValueNotifier(0);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(
        title: Text("Fill in Your Child’s Details"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    "You need to fill in the following details about your child to buy books.",
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: const Color(0xff848588)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomFormWidget(
                    controller: childName,
                    hint: "Child’s Name *",
                    obsecure: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomFormWidget(
                    controller: grade,
                    hint: "Grade *",
                    obsecure: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField(
                    validator: (value) {
                      if (value == null) {
                        return 'Please select gender';
                      }
                    },
                    hint: Text(
                      "Select Gender",
                      style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                    items: [
                      DropdownMenuItem(
                        value: 1,
                        child: Text("Male"),
                      ),
                      DropdownMenuItem(
                        value: 2,
                        child: Text("Female"),
                      ),
                    ],
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.only(
                          left: 20, top: 15.5, bottom: 15.5, right: 22.02),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffE9ECEF),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffE9ECEF),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onChanged: (value) {
                      gender.value = value!;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomFormWidget(
                    controller: idNumber,
                    hint: "ID Number",
                    obsecure: false,
                    inputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomFormWidget(
                    controller: streetAddress,
                    hint: "Street Address",
                    obsecure: false,
                    inputType: TextInputType.phone,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomFormWidget(
                    controller: unitNumber,
                    hint: "Unit Number (Optional)",
                    obsecure: false,
                    inputType: TextInputType.phone,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomFormWidget(
                    controller: complex,
                    hint: "Complex (Optional)",
                    obsecure: false,
                    inputType: TextInputType.phone,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField(
                    validator: (value) {
                      if (value == null) {
                        return 'Please select city';
                      }
                    },
                    hint: Text(
                      "Select City",
                      style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                    items: [
                      DropdownMenuItem(
                        value: 1,
                        child: Text("San Fransisco"),
                      ),
                      DropdownMenuItem(
                        value: 2,
                        child: Text("Los Angles"),
                      ),
                    ],
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.only(
                          left: 20, top: 15.5, bottom: 15.5, right: 22.02),
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
                    onChanged: (value) {
                      gender.value = value!;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomFormWidget(
                    controller: postalCode,
                    hint: "Postal Code  ",
                    obsecure: false,
                    inputType: TextInputType.phone,
                  ),
                  const SizedBox(
                    height: 56,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print("holla4");
                      if(_formKey.currentState!.validate()){
                        print("holla");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    VerifyPage(email: widget.email)));
                      }
                    },
                    child: Text(
                      "Continue",
                      style: GoogleFonts.urbanist(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
