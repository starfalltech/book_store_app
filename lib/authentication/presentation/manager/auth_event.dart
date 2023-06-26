part of 'auth_bloc.dart';


abstract class AuthEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class LoginEvent extends AuthEvent{
  final String email;
  final String password;

  LoginEvent(this.email, this.password);
}
class PostVerify extends AuthEvent{
  final String email;
  final String code;

  PostVerify(this.email, this.code);
}

class RegisterEvent extends AuthEvent{
  final String email;
  final String name;
  final String cell;
  final String passsword;

  RegisterEvent(this.email, this.name, this.cell, this.passsword);
}
