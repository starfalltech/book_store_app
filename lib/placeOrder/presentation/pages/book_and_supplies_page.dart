import 'package:book_store_app/placeOrder/presentation/pages/checkout_page.dart';
import 'package:book_store_app/widget/custom_appbar_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookAndSuppliesPage extends StatefulWidget {
  const BookAndSuppliesPage({super.key});

  @override
  State<BookAndSuppliesPage> createState() => _BookAndSuppliesPageState();
}

class _BookAndSuppliesPageState extends State<BookAndSuppliesPage> {
  List<String> images = [
    "assets/images/product1.png",
    "assets/images/product2.png",
    "assets/images/product3.png",
    "assets/images/product4.png",
    "assets/images/product1.png",
    "assets/images/product2.png",
    "assets/images/product3.png",
    "assets/images/product4.png",
  ];

  ValueNotifier<List<int>> bookList = ValueNotifier([]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(
        title: Text("Books & Supplies"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: ValueListenableBuilder(
          valueListenable: bookList,
          builder: (context,value,_) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Choose your preference",
                  style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Here are the Books and supplies of the selected grade for this year, you can choose which ever you want to buy.",
                  style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xff848588)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child:ListView.separated(
                    itemCount: images.length,
                    shrinkWrap: true,
                    separatorBuilder: (_, __) => SizedBox(
                      height: 10,
                    ),
                    itemBuilder: (c, i) => Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: const Color(0xffE9ECEF))),
                      child: Row(
                        children: [
                          Checkbox(
                              value: value.contains(i),
                              onChanged: (valuec) {
                                if(value.contains(i)){
                                  value.remove(i);
                                }else{
                                  value.add(i);
                                }
                                bookList.value = List.from(value);
                              }),
                          Image.asset(images[i], width: 50, height: 50),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Subject One",
                            style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          const Spacer(),
                          Text(
                            "R 4.12",
                            style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ),
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
                      "R ${value.length * 4.12}",
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
                              builder: (context) =>  CheckoutPage(countPrice: value.length*4.12,)));
                    },
                    child: Text(
                      "Proceed",
                      style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.w700, fontSize: 18),
                    )),
                const SizedBox(
                  height: 34,
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}

class BookModel {
  final int id;
  final double price;

  BookModel(this.id, this.price);
}
