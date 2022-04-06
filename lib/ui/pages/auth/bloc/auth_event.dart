part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginUser extends AuthEvent {
  final Map<String, dynamic> jsonSend;
  const LoginUser(this.jsonSend);
}

class RegisterUser extends AuthEvent {
  final Map<String, dynamic> jsonSend;
  const RegisterUser(this.jsonSend);
}
