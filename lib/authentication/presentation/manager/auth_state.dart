part of 'auth_bloc.dart';


abstract class AuthState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {

}

class LoadingAuthState extends AuthState{

}

class SuccesAuthState extends AuthState{

}

class FailureAuthState extends AuthState{
  final String msg;

  FailureAuthState(this.msg);
}

