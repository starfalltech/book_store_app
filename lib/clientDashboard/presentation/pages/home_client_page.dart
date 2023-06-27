import 'package:book_store_app/clientDashboard/presentation/pages/order_history_page.dart';
import 'package:book_store_app/core/local_auth_storage.dart';
import 'package:book_store_app/onBoarding/pages/on_boarding_page.dart';
import 'package:book_store_app/placeOrder/presentation/pages/place_order_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../widget/card_transaction_widget.dart';

class HomeClientPage extends StatefulWidget {
  const HomeClientPage({super.key});

  @override
  State<HomeClientPage> createState() => _HomeClientPageState();
}

class _HomeClientPageState extends State<HomeClientPage> {

  String greeting() {
    var hour = DateTime.now().hour;

    if (hour < 12) {
      return 'Morning';
    }
    if (hour < 17) {
      return 'Afternoon';
    }
    return 'Evening';
  }
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
                        "Good ${greeting()}",
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
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 20.w,
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () async {
                        await showDialog(
                          context: context,
                          builder: (context) =>
                              AlertDialog(
                                title: const Text("Logout"),
                                content: const Text(
                                    "are you sure you want to logout ?"),
                                actions: [
                                  SizedBox(
                                    height: 40,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.white),
                                            child: const Text("Cancel",
                                              style: TextStyle(
                                                  color: Colors.black),),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: ElevatedButton(
                                              onPressed: () async {
                                                await LocalAuthStorage()
                                                    .delete()
                                                    .then((value) =>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const
                                                OnBoardingPage())));
                                              }, child: const Text("Yes")),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                        );
                      },
                      child: const Text("Logout"),
                    ),
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
                    separatorBuilder: (context, i) =>
                    const SizedBox(
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
