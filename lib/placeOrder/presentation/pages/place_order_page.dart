import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlaceOrderPage extends StatelessWidget {
  const PlaceOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            "Address",
            style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: const Color(0xff0B090A)),
          ),
          Text(
            "Address",
            style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: const Color(0xff0B090A)),
          )
        ],
      ),
    );
  }
}
