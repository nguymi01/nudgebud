part of 'profile_photo_form_bloc.dart';

sealed class ProfilePhotoFormState extends Equatable {
  const ProfilePhotoFormState();

  @override
  List<Object> get props => [];
}

final class ProfilePhotoFormInitial extends ProfilePhotoFormState {}

class ProfilePhotoFormLoading extends ProfilePhotoFormState {}

class ProfilePhotoSelected extends ProfilePhotoFormState {
  final XFile? image;

  const ProfilePhotoSelected({this.image});
}
