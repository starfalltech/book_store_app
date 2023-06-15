import 'package:book_store_app/widget/custom_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../clientDashboard/presentation/pages/home_client_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              height: 100.h,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    SvgPicture.asset("assets/icons/icon_book_brown.svg"),
                    Text(
                      "Login",
                      style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.w700, fontSize: 26),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Login to access your account.",
                      style: GoogleFonts.urbanist(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff848588)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomFormWidget(
                      controller: email,
                      hint: "Email or phone no.",
                      obsecure: false,
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
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password?',
                        style: GoogleFonts.urbanist(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff2176FF)),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const HomeClientPage()),
                                (Route<dynamic> route) => false);
                          }
                        },
                        child: Text(
                          "Login",
                          style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        )),
                    const SizedBox(
                      height: 39.5,
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
                    const Spacer(),
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
      ),
    );
  }
}
