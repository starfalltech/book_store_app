import 'package:book_store_app/onBoarding/pages/about_page.dart';
import 'package:book_store_app/widget/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class TermsConditionPage extends StatefulWidget {
  final int langIndex;

  const TermsConditionPage({super.key, required this.langIndex});

  @override
  State<TermsConditionPage> createState() => _TermsConditionPageState();
}

class _TermsConditionPageState extends State<TermsConditionPage> {
  final String engls =
      "Torem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent auctor purus luctus enim egestas, ac scelerisque ante pulvinar. Donec ut rhoncus ex. Suspendisse ac rhoncus nisl, eu tempor urna. Curabitur vel bibendum lorem. Morbi convallis convallis diam sit amet lacinia. Aliquam in elementum tellus.\n\nCurabitur tempor quis eros tempus lacinia. Nam bibendum pellentesque quam a convallis. Sed ut vulputate nisi. Integer in felis sed leo vestibulum venenatis. Suspendisse quis arcu sem. Aenean feugiat ex eu vestibulum vestibulum. Morbi a eleifend magna. Nam metus lacus, porttitor eu mauris a, blandit ultrices nibh.\n\nMauris sit amet magna non ligula vestibulum eleifend. Nulla varius volutpat turpis sed lacinia. Nam eget mi in purus lobortis eleifend. Sed nec ante dictum sem condimentum ullamcorper quis venenatis nisi. Proin vitae facilisis nisi, ac posuere leo.";
  final String afrikaans =
      "Torem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent auctor purus luctus enim egestas, ac scelerisque ante pulvinar. Donec ut rhoncus ex. Suspendisse ac rhoncus nisl, eu tempor urna. Curabitur vel bibendum lorem. Morbi convallis convallis diam sit amet lacinia. Aliquam in elementum tellus.\n\nCurabitur tempor quis eros tempus lacinia. Nam bibendum pellentesque quam a convallis. Sed ut vulputate nisi. Integer in felis sed leo vestibulum venenatis. Suspendisse quis arcu sem. Aenean feugiat ex eu vestibulum vestibulum. Morbi a eleifend magna. Nam metus lacus, porttitor eu mauris a, blandit ultrices nibh.\n\nMauris sit amet magna non ligula vestibulum eleifend. Nulla varius volutpat turpis sed lacinia. Nam eget mi in purus lobortis eleifend. Sed nec ante dictum sem condimentum ullamcorper quis venenatis nisi. Proin vitae facilisis nisi, ac posuere leo.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
          title: widget.langIndex == 1
              ? Text("Terms & Condition")
              : Text("Popia Document")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              Text(
                widget.langIndex == 1 ? engls : afrikaans,
                style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff848588),
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutPage()),
                      (Route<dynamic> route) => false);
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
          ),
        ),
      ),
    );
  }
}
