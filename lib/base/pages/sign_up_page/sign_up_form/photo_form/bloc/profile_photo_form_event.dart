part of 'profile_photo_form_bloc.dart';

sealed class ProfilePhotoFormEvent extends Equatable {
  const ProfilePhotoFormEvent();

  @override
  List<Object> get props => [];
}

class ProfilePhotoFormEventSelectPhoto extends ProfilePhotoFormEvent {
  final XFile? image;

  const ProfilePhotoFormEventSelectPhoto({this.image});
}

class ProfilePhotoFormDeletePhoto extends ProfilePhotoFormEvent {}
