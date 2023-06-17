import 'package:book_store_app/authentication/presentation/pages/verify_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../widget/custom_form_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final noPhone = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  SvgPicture.asset("assets/icons/icon_book_brown.svg"),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Register",
                    style: GoogleFonts.urbanist(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Create an account to buy books for your kids",
                    style: GoogleFonts.urbanist(
                      fontSize: 16,
                      color: const Color(0xff848588),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
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
                  const SizedBox(
                    height: 20,
                  ),
                  CustomFormWidget(
                    controller: password,
                    hint: "Password",
                    obsecure: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomFormWidget(
                    controller: confirmPassword,
                    hint: "Confirm Password",
                    obsecure: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                        side: const BorderSide(
                          color: Color(0xff848588),
                          width: 1,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      RichText(
                        text: TextSpan(
                            text: "I agree to the ",
                            style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: const Color(0xff848588)),
                            children: [
                              TextSpan(
                                text: "Terms & Condition",
                                style: GoogleFonts.urbanist(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  decoration: TextDecoration.underline,
                                  color: const Color(0xff2176FF),
                                ),
                              )
                            ]),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final nameEmail = email.text.split("@").first.trim();
                        final hostEmail = email.text.split("@").last.trim();
                        List<String> nameEmailSensor=[];
                        for(int i=1;i<nameEmail.length;i++){
                          nameEmailSensor.add("*");
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VerifyPage(
                                    email: "@$hostEmail",
                                  )),
                        );
                      }
                    },
                    child: Text(
                      "Register",
                      style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: const Color(0xff5C677D).withOpacity(0.25),
                          ),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        const Text(
                          "or",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff5C677D)),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: const Color(0xff5C677D).withOpacity(0.25),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/apple_sign.png",
                        width: 80,
                        height: 80,
                      ),
                      Image.asset(
                        "assets/images/fb_sign.png",
                        width: 80,
                        height: 80,
                      ),
                      Image.asset(
                        "assets/images/google_sign.png",
                        width: 80,
                        height: 80,
                      ),
                    ],
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Don’t have an account?",
                        style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: const Color(0xff848588)),
                        children: [
                          TextSpan(
                            text: " Sign Up",
                            style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: const Color(0xff2176FF),
                            ),
                          )
                        ]),
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
