import 'package:book_store_app/authentication/domain/repositories/authentication_repository.dart';
import 'package:book_store_app/clientDashboard/presentation/pages/home_client_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sizer/sizer.dart';

import '../../../widget/custom_form_widget.dart';
import '../manager/auth_bloc.dart';

class VerifyPage extends StatefulWidget {
  final String email;

  const VerifyPage({super.key, required this.email});

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  final code = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final nameuser = widget.email.split("@");
    String emailcaracter = widget.email
        .replaceRange(4, nameuser[0].length, "*" * (nameuser[0].length - 2));
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            AuthBloc(
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
                      builder: (context) => const HomeClientPage()));
            }
          },
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: SizedBox(
                    height: 100.h - 10,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        SvgPicture.asset("assets/icons/icon_book_brown.svg"),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Verify It’s You",
                          style: GoogleFonts.urbanist(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text:
                              "We have sent a verification code to your email\n",
                              style: GoogleFonts.urbanist(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: const Color(0xff848588)),
                              children: [
                                TextSpan(
                                  text: emailcaracter,
                                  style: GoogleFonts.urbanist(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                                )
                              ]),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomFormWidget(
                          controller: code,
                          hint: "Enter code",
                          obsecure: false,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              context.read<AuthBloc>().add(PostVerify(widget.email, code.text));
                            },
                            child: Text(
                              "Verify",
                              style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                                text:
                                "It may take a minute to receive your code.\nHaven’t received it? ",
                                style: GoogleFonts.urbanist(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: const Color(0xff848588)),
                                children: [
                                  TextSpan(
                                    text: "Resend a new code",
                                    style: GoogleFonts.urbanist(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      decoration: TextDecoration.underline,
                                      color: const Color(0xff2176FF),
                                    ),
                                  )
                                ]),
                          ),
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
              );
            },
          ),
        ),
      ),
    );
  }
}
