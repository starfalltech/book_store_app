import 'package:book_store_app/onBoarding/pages/select_language_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../authentication/domain/repositories/authentication_repository.dart';
import '../../authentication/presentation/manager/auth_bloc.dart';
import '../../authentication/presentation/pages/login_page.dart';
import '../../authentication/presentation/pages/register_page.dart';
import '../../clientDashboard/presentation/pages/home_client_page.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(
          repository: RepositoryProvider.of<AuthenticationRepository>(context)),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is SuccesAuthState) {
            context.loaderOverlay.hide();
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const HomeClientPage()),
                    );
          }
          if (state is LoadingAuthState) {
            context.loaderOverlay.show();
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return Scaffold(
              body: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Image.asset('assets/images/onboarding_image.png'),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 10, bottom: 20),
                            width: 40,
                            height: 8,
                            decoration: BoxDecoration(
                                color:
                                    const Color(0xff848588).withOpacity(0.16),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPage()));
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 16,
                                  shadowColor:
                                      const Color(0xff944832).withOpacity(0.45),
                                ),
                                child: Text(
                                  'Login',
                                  style: GoogleFonts.urbanist(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterPage(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    elevation: 0,
                                    side: const BorderSide(
                                        width: 1, color: Color(0xffE9ECEF))),
                                child: Text(
                                  'Register',
                                  style: GoogleFonts.urbanist(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      color: Colors.black),
                                )),
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
                              GestureDetector(
                                onTap: () async {
                                  context.read<AuthBloc>().add(SignInGoogle());
                                },
                                child: Image.asset(
                                  "assets/images/google_sign.png",
                                  width: 80,
                                  height: 80,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SelectLanguagePage(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    elevation: 0,
                                    side: const BorderSide(
                                        width: 1,
                                        color: const Color(0xffD89E46))),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'How it works',
                                      style: GoogleFonts.urbanist(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                          color: const Color(0xffD89E46)),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 11.0),
                                      child: SvgPicture.asset(
                                          'assets/icons/icon_play.svg'),
                                    )
                                  ],
                                )),
                          ),
                          const SizedBox(
                            height: 21,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
