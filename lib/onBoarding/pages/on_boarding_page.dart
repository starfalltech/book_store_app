import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../authentication/presentation/pages/login_page.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                        color: const Color(0xff848588).withOpacity(0.16),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()));
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
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: ElevatedButton(
                        onPressed: () {},
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
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 0,
                            side: const BorderSide(
                                width: 1, color: const Color(0xffD89E46))),
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
                              padding: const EdgeInsets.only(left: 11.0),
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
  }
}
