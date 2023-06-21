import 'package:book_store_app/clientDashboard/presentation/pages/order_history_page.dart';
import 'package:book_store_app/placeOrder/presentation/pages/place_order_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widget/card_transaction_widget.dart';

class HomeClientPage extends StatelessWidget {
  const HomeClientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlaceOrderPage(),
                      ));
                },
                child: Image.asset("assets/images/order_dashboard.png"),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Transaction History",
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: const Color(0xffD89E46)),
                  ),
                  Text(
                    "View all",
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        color: const Color(0xff2176FF)),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.5,
              ),
              Expanded(
                child: ListView.separated(
                    itemCount: 2,
                    shrinkWrap: true,
                    separatorBuilder: (context, i) => const SizedBox(
                          height: 10,
                        ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OrderHistoryPage(),
                            ),
                          );
                        },
                        child: const CardTransactionWidget(),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
