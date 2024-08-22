part of 'gender_form_bloc.dart';

@immutable
sealed class GenderFormState {}

final class GenderFormInitial extends GenderFormState {}

class GenderFormStateChosen extends GenderFormState {
  final String gender;

  GenderFormStateChosen(this.gender);
}
