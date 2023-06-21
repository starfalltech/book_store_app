import 'package:book_store_app/placeOrder/presentation/widgets/addess_place_order_widget.dart';
import 'package:book_store_app/placeOrder/presentation/widgets/child_details_place_order_widget.dart';
import 'package:book_store_app/widget/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../widget/custom_form_widget.dart';

class PlaceOrderPage extends StatefulWidget {
  const PlaceOrderPage({super.key});

  @override
  State<PlaceOrderPage> createState() => _PlaceOrderPageState();
}

class _PlaceOrderPageState extends State<PlaceOrderPage> {
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: const Text("Place Order"),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/icon_arrow_left.svg"),
          onPressed: () {
            if (controller.page == 1) {
              controller.previousPage(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.ease);
            } else {
              Navigator.pop(context);
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 100.h - 85,
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (value) {
                    print(controller.page);
                  },
                  controller: controller,
                  children: [
                    AddessPlaceOrderWidget(controller: controller),
                    ChildDetailsPlaceOrderWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
