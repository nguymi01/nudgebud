part of 'birthday_form_bloc.dart';

@immutable
sealed class BirthdayFormEvent {}

class BirthdayFormEventSelectDate extends BirthdayFormEvent{
  final DateTime date;

  BirthdayFormEventSelectDate(this.date);
}
