import 'package:book_store_app/authentication/domain/repositories/authentication_repository.dart';
import 'package:book_store_app/authentication/presentation/manager/auth_bloc.dart';
import 'package:book_store_app/authentication/presentation/pages/verify_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
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
  ValueNotifier<bool> iAngree = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(
            repository:
                RepositoryProvider.of<AuthenticationRepository>(context)),
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is FailureAuthState) {
              context.loaderOverlay.hide();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(state.msg),
                ),
              );
            }
            if (state is LoadingAuthState) {
              context.loaderOverlay.show();
            }
            if (state is SuccesAuthState) {
              context.loaderOverlay.hide();
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        VerifyPage(email: email.text.toLowerCase())),
              );
            }
          },
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: (){
                  FocusScope.of(context).unfocus();
                },

                child: SafeArea(
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
                              validation: (value) {
                                if (!EmailValidator.validate(value!)) {
                                  return "invalid email address";
                                }
                              },
                              inputType: TextInputType.emailAddress,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomFormWidget(
                              controller: noPhone,
                              hint: "Phone No. *",
                              obsecure: false,
                              inputFormaters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]')),
                              ],
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
                              validation: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                if (password.text.trim() !=
                                    confirmPassword.text.trim()) {
                                  return "please enter the same password !";
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                ValueListenableBuilder(
                                    valueListenable: iAngree,
                                    builder: (context, value, _) {
                                      return Checkbox(
                                        value: value,
                                        onChanged: (value) {
                                          iAngree.value = !iAngree.value;
                                        },
                                        side: const BorderSide(
                                          color: Color(0xff848588),
                                          width: 1,
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      );
                                    }),
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
                                  if (iAngree.value) {
                                    context.read<AuthBloc>().add(RegisterEvent(
                                        email.text,
                                        firstName.text.trim() +
                                            lastName.text.trim(),
                                        noPhone.text,
                                        password.text));
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'please select I agree to the Terms & Condition'),
                                      ),
                                    );
                                  }
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Divider(
                                      thickness: 1,
                                      color: const Color(0xff5C677D)
                                          .withOpacity(0.25),
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
                                      color: const Color(0xff5C677D)
                                          .withOpacity(0.25),
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
            },
          ),
        ),
      ),
    );
  }
}
