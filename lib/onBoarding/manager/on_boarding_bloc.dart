import 'dart:async';

import 'package:book_store_app/authentication/presentation/manager/auth_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/local_auth_storage.dart';

part 'on_boarding_event.dart';

part 'on_boarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  OnBoardingBloc() : super(OnBoardingInitial()) {
    on<CheckAuth>(checkAuthEventToState);
  }

  FutureOr<void> checkAuthEventToState(
      CheckAuth event, Emitter<OnBoardingState> emit) async{
    try {
      await LocalAuthStorage().read("token").then((value) async {
        await Future.delayed(const Duration(milliseconds: 2000));
        emit(
          SuccesOnBoardingState(),
        );
      });
    } catch (e) {
      await Future.delayed(const Duration(milliseconds: 2000));
      emit(
        FailureOnBoardingState(),
      );
    }
  }
}
