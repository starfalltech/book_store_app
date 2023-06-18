import 'package:book_store_app/onBoarding/pages/terms_condition_page.dart';
import 'package:book_store_app/widget/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectLanguagePage extends StatefulWidget {
  const SelectLanguagePage({super.key});

  @override
  State<SelectLanguagePage> createState() => _SelectLanguagePageState();
}

class _SelectLanguagePageState extends State<SelectLanguagePage> {
  ValueNotifier<int> language = ValueNotifier(1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(title: Text("Select Language")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: ValueListenableBuilder(
            valueListenable: language,
            builder: (context, value, _) {
              return Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/english_flag.png",
                        width: 20,
                        height: 16,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "English",
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),
                      Radio<int>(
                          value: 1,
                          groupValue: value,
                          onChanged: (value) {
                            language.value = 1;
                          })
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/afrikaans_flag.png",
                        width: 20,
                        height: 16,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Afrikaans",
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),
                      Radio<int>(
                          value: 2,
                          groupValue: value,
                          onChanged: (value) {
                            language.value = 2;
                          })
                    ],
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  TermsConditionPage(langIndex: value)));
                    },
                    child: Text(
                      "Continue",
                      style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 34,
                  )
                ],
              );
            }),
      ),
    );
  }
}
