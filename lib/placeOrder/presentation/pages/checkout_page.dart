import 'package:book_store_app/placeOrder/presentation/pages/confirm_order_page.dart';
import 'package:book_store_app/widget/custom_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widget/custom_appbar_widget.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  ValueNotifier<int> payment = ValueNotifier(1);
  ValueNotifier<int> delivery = ValueNotifier(1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(
        title: Text("Checkout"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  delivery.value = 1;
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6.5,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xffE9ECEF),
                      ),
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery Via Fastway",
                        style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      ValueListenableBuilder(
                          valueListenable: delivery,
                          builder: (context, value, _) {
                            return Radio(
                              value: 1,
                              groupValue: delivery.value,
                              activeColor: const Color(0xff2176FF),
                              onChanged: (value) {},
                            );
                          }),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  delivery.value = 2;
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6.5,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xffE9ECEF),
                      ),
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Pickup at Warehouse",
                        style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      ValueListenableBuilder(
                          valueListenable: delivery,
                          builder: (context, value, _) {
                            return Radio(
                              value: 2,
                              groupValue: delivery.value,
                              activeColor: const Color(0xff2176FF),
                              onChanged: (value) {},
                            );
                          }),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: 1,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Payment",
                style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  payment.value = 1;
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xffE9ECEF),
                      ),
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    children: [
                      ValueListenableBuilder(
                          valueListenable: payment,
                          builder: (context, value, _) {
                            return Radio(
                              value: 1,
                              groupValue: payment.value,
                              activeColor: const Color(0xff2176FF),
                              onChanged: (value) {},
                            );
                          }),
                      Text(
                        "Credit Card",
                        style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  payment.value = 2;
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xffE9ECEF),
                      ),
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    children: [
                      ValueListenableBuilder(
                          valueListenable: payment,
                          builder: (context, value, _) {
                            return Radio(
                              value: 2,
                              groupValue: payment.value,
                              activeColor: const Color(0xff2176FF),
                              onChanged: (value) {},
                            );
                          }),
                      Text(
                        "Electronic Fund Transfer (EFT)",
                        style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: 1,
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomFormWidget(
                obsecure: false,
                hint: "Card number",
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomFormWidget(
                obsecure: false,
                hint: "Card holder name",
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: const CustomFormWidget(
                      obsecure: false,
                      hint: "Exp. date",
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: const CustomFormWidget(
                      obsecure: false,
                      hint: "CVV",
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomFormWidget(
                obsecure: false,
                hint: "Save card name",
              ),
              Row(
                children: [
                  Checkbox(
                    value: false,
                    side: const BorderSide(color: Color(0xff848588), width: 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    onChanged: (value) {},
                  ),
                  Expanded(
                    child: Text(
                      "Save this card for future",
                      style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: const Color(0xff848588),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: GoogleFonts.urbanist(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "R 16.48",
                    style: GoogleFonts.urbanist(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ConfirmOrderPage()));
                  },
                  child: Text(
                    "Place Order",
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w700, fontSize: 18),
                  )),
              const SizedBox(
                height: 34,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
