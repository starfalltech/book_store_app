import 'package:book_store_app/placeOrder/presentation/pages/book_and_supplies_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../widget/custom_form_widget.dart';

class ChildDetailsPlaceOrderWidget extends StatefulWidget {
  const ChildDetailsPlaceOrderWidget({
    super.key,
  });

  @override
  State<ChildDetailsPlaceOrderWidget> createState() =>
      _ChildDetailsPlaceOrderWidgetState();
}

class _ChildDetailsPlaceOrderWidgetState
    extends State<ChildDetailsPlaceOrderWidget> {
  final grade = TextEditingController();
  ValueNotifier<int> gender = ValueNotifier(0);
  final _formKeyChildDetails = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Form(
          key: _formKeyChildDetails,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Fill in Your Child’s Details",
                style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: const Color(0xff0B090A)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "You need to fill in the following details about your child to buy books.",
                style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: const Color(0xff848588)),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomFormWidget(
                controller: grade,
                hint: "Grade *",
                obsecure: false,
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownButtonFormField(
                validator: (value) {
                  if (value == null) {
                    return 'Please select city';
                  }
                },
                hint: Text(
                  "Select Gender",
                  style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black),
                ),
                items: [
                  DropdownMenuItem(
                    value: 1,
                    child: Text("Male"),
                  ),
                  DropdownMenuItem(
                    value: 2,
                    child: Text("Female"),
                  ),
                ],
                icon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.only(
                      left: 20, top: 15.5, bottom: 15.5, right: 22.02),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xffE9ECEF),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xffE9ECEF),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onChanged: (value) {
                  gender.value = value!;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: 1,
                color: Color(0xff5C677D),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Add Subjects",
                style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: const Color(0xff0B090A)),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: List.generate(
                    3,
                    (index) => Container(
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border:
                                  Border.all(color: const Color(0xffE9ECEF))),
                          padding: const EdgeInsets.only(
                            top: 15.5,
                            bottom: 15.5,
                            left: 20,
                            right: 17,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Subject ${++index}",
                                style: GoogleFonts.urbanist(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              SvgPicture.asset(
                                  "assets/icons/icon_trash_red.svg")
                            ],
                          ),
                        )),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 11.5, horizontal: 13.5),
                decoration: BoxDecoration(
                    color: const Color(0xff944832).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.add, color: Color(0xff944832)),
                    Text(
                      "Add Subject",
                      style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: const Color(0xff944832)),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 151,
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
                    child: RichText(
                      text: TextSpan(
                          text: "I agree to  agree to be bound by these ",
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: const Color(0xff848588)),
                          children: [
                            TextSpan(
                              text: "Terms & Conditions",
                              style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                                fontSize: 14,
                                color: const Color(0xff2176FF),
                              ),
                            ),
                            TextSpan(
                              text: " and",
                              style: GoogleFonts.urbanist(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: const Color(0xff848588)),
                            ),
                            TextSpan(
                              text: " User Agreement.",
                              style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                                fontSize: 14,
                                color: const Color(0xff2176FF),
                              ),
                            ),
                          ]),
                    ),
                  ),
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
                            builder: (context) => const BookAndSuppliesPage()));
                  },
                  child: Text(
                    "Continue",
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
