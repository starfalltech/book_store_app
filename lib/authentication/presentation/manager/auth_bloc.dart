import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>(loginEventToState);
    on<RegisterEvent>(registerEventToState);
  }

  FutureOr<void> loginEventToState(LoginEvent event, Emitter<AuthState> emit) {
    emit(LoadingAuthState());
  }

  FutureOr<void> registerEventToState(RegisterEvent event, Emitter<AuthState> emit) {
    emit(LoadingAuthState());
  }
}
