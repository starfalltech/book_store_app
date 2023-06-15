part of 'auth_bloc.dart';


abstract class AuthEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class LoginEvent extends AuthEvent{

}

class RegisterEvent extends AuthEvent{

}
