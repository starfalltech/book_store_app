import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 32,
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/images/user.png",
                    width: 42,
                    height: 42,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Text(
                        "Good Morning",
                        style: GoogleFonts.urbanist(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Mary Robbins",
                        style: GoogleFonts.urbanist(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset("assets/images/childern_img.png"),
              const SizedBox(
                height: 20,
              ),
              Text(
                "About Store",
                style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w700, fontSize: 16),
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus.",
                style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: const Color(0xff81999B)),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Opening Hours:",
                style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              Text(
                "Mon - Fri • 09:00am - 04:00pm",
                style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0xffB5B6B8)),
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  SvgPicture.asset("assets/icons/icon_contact_us.svg"),
                  const SizedBox(width: 10,),
                  const Text("Contact Us"),
                  const Spacer(),
                  SvgPicture.asset("assets/icons/icon_arrow_right.svg")
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  SvgPicture.asset("assets/icons/icon_bank.svg"),
                  const SizedBox(width: 10,),
                  const Text("Banking Information"),
                  const Spacer(),
                  SvgPicture.asset("assets/icons/icon_arrow_right.svg")
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  SvgPicture.asset("assets/icons/icon_delivery.svg"),
                  const SizedBox(width: 10,),
                  const Text("Delivery Policy"),
                  const Spacer(),
                  SvgPicture.asset("assets/icons/icon_arrow_right.svg")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
