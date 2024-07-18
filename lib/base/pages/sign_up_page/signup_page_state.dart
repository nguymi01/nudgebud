part of 'signup_page_bloc.dart';

@immutable
sealed class SignupPageState {}

final class SignupPageInitial extends SignupPageState {}
class SignupPageStateLoading extends SignupPageState{}
class SignupPageStateSuccess extends SignupPageState{}
class SignupPageStateFail extends SignupPageState{
  final String error;

  SignupPageStateFail(this.error);
}
class SignupPageStateDismissLoading extends SignupPageState{}
class SignupPageStateSubmit extends SignupPageState{}