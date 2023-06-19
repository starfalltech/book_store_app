import 'package:book_store_app/authentication/presentation/pages/child_registration_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../widget/custom_appbar_widget.dart';
import '../../../widget/custom_form_widget.dart';

class ParentRegistrationPage extends StatefulWidget {
  const ParentRegistrationPage({super.key});

  @override
  State<ParentRegistrationPage> createState() => _ParentRegistrationPageState();
}

class _ParentRegistrationPageState extends State<ParentRegistrationPage> {
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final noPhone = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(
        title: Text("Parents Information"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: 100.h - 85,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomFormWidget(
                      controller: firstName,
                      hint: "First Name *",
                      obsecure: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomFormWidget(
                      controller: lastName,
                      hint: "Last Name *",
                      obsecure: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomFormWidget(
                      controller: email,
                      hint: "Email *",
                      obsecure: false,
                      inputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomFormWidget(
                      controller: noPhone,
                      hint: "Phone No. *",
                      obsecure: false,
                      inputType: TextInputType.phone,
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                       if(_formKey.currentState!.validate()){
                         Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) =>
                                 ChildRegistrationPage(email: email.text),
                           ),
                         );
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
      ),
    );
  }
}
