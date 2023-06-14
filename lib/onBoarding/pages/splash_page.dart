
import 'package:book_store_app/widget/loading_spin_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../manager/on_boarding_bloc.dart';
import 'on_boarding_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => OnBoardingBloc()..add(CheckAuth()),
        child: BlocListener<OnBoardingBloc, OnBoardingState>(
          listener: (context, state) {
            if (state is SuccesOnBoardingState) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const OnBoardingPage(),
                ),
              );
            }
          },
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset('assets/images/splash_bg.png',
                    fit: BoxFit.cover),
              ),
              Positioned.fill(
                child: Center(
                  child: SvgPicture.asset(
                    "assets/icons/icon_book_splash.svg",
                  ),
                ),
              ),
              const Positioned(
                bottom: 36,
                left: 0,
                right: 0,
                child: LoadingSpinWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
