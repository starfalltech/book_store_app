import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widget/custom_appbar_widget.dart';

class SuccesFullOrderPage extends StatelessWidget {
  const SuccesFullOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(
        title: Text("Confirm Order"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/icons/icon_mail.svg"),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Order Placed Successfully!",
              textAlign: TextAlign.center,
              style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w600,
                color: const Color(0xff848588),
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
