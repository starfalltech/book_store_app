import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/failure.dart';
import '../../../core/local_auth_storage.dart';
import '../../domain/repositories/authentication_repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthenticationRepository repository;

  AuthBloc({required this.repository}) : super(AuthInitial()) {
    on<LoginEvent>(loginEventToState);
    on<RegisterEvent>(registerEventToState);
    on<PostVerify>(verifyMapToState);
  }

  FutureOr<void> loginEventToState(
      LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoadingAuthState());
    final postRegister = await repository.login(event.email, event.password);
    postRegister.fold((l) {
      if (l is ServerFailure) {
        emit(FailureAuthState(l.msg));
      }
    }, (r) => emit(SuccesAuthState()));
  }

  FutureOr<void> registerEventToState(
      RegisterEvent event, Emitter<AuthState> emit) async {
    emit(LoadingAuthState());
    final postRegister = await repository.register(
        event.email, event.passsword, event.cell, event.name);
    postRegister.fold((l) {
      if (l is ServerFailure) {
        emit(FailureAuthState(l.msg));
      }
    }, (r) => emit(SuccesAuthState()));
  }

  FutureOr<void> verifyMapToState(PostVerify event, Emitter<AuthState> emit) async{
    emit(LoadingAuthState());
    final postRegister = await repository.verify(event.email, event.code);
    postRegister.fold((l) {
      if (l is ServerFailure) {
        emit(FailureAuthState(l.msg));
      }
    }, (r) => emit(SuccesAuthState()));
  }
}
