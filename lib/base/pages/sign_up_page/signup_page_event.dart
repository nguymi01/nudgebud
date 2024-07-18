part of 'signup_page_bloc.dart';

@immutable
sealed class SignupPageEvent {}

class SignupPageEventSubmit extends SignupPageEvent {
  final String fname;
  final String lname;
  final String email;
  final String password;

  SignupPageEventSubmit(this.fname, this.lname, this.email, this.password);
}
