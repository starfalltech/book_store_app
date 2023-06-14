import 'package:book_store_app/core/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'onBoarding/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppThemeData.getTheme(context),
          home: const SplashPage(),
        );
      }
    );
  }
}
