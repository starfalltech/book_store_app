import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'on_boarding_event.dart';

part 'on_boarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  OnBoardingBloc() : super(OnBoardingInitial()) {
    on<CheckAuth>(checkAuthEventToState);
  }

  FutureOr<void> checkAuthEventToState(
      CheckAuth event, Emitter<OnBoardingState> emit) async{
   await Future.delayed(const Duration(milliseconds: 2000))
        .then((value) => emit(SuccesOnBoardingState()));
  }
}
