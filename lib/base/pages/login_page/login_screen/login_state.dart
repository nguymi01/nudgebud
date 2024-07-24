part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
class LoginStateLoading extends LoginState{}
class LoginStateSuccess extends LoginState{}
class LoginStateFail extends LoginState{
  final String error;

  LoginStateFail(this.error);
}