part of 'gender_form_bloc.dart';

@immutable
sealed class GenderFormEvent {}
class GenderFormEventClickButton extends GenderFormEvent{
  final String gender;

  GenderFormEventClickButton(this.gender);
}