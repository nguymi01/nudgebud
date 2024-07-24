part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginEventClickButton extends LoginEvent{
  final String email;
  final String password;

  LoginEventClickButton(this.email, this.password);
}
