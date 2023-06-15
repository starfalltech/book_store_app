import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
class CardTransactionWidget extends StatelessWidget {
  const CardTransactionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
            color: const Color(0xffE9ECEF), width: 1),
      ),
      child: Row(
        children: [
          SvgPicture.asset("assets/icons/icon_paper.svg"),
          Text(
            "Grade III",
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          const Spacer(),
          Text(
            "R 25.00",
            style: GoogleFonts.urbanist(
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}