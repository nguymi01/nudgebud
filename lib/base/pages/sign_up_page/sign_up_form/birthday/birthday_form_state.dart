part of 'birthday_form_bloc.dart';

@immutable
sealed class BirthdayFormState {}

final class BirthdayFormInitial extends BirthdayFormState {}
class BirthdayFormStateDisplayDate extends BirthdayFormState{
  final DateTime date;

  BirthdayFormStateDisplayDate(this.date);
}