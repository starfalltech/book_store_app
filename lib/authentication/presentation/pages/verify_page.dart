import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifyPage extends StatelessWidget {
  final String email;
  const VerifyPage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          Text(
            "We have sent a verification code to your email\n$email",
            style: GoogleFonts.urbanist(
              fontSize: 16,
              color: const Color(0xff848588),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
