import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_photo_form_event.dart';
part 'profile_photo_form_state.dart';

class ProfilePhotoFormBloc
    extends Bloc<ProfilePhotoFormEvent, ProfilePhotoFormState> {
  ProfilePhotoFormBloc() : super(ProfilePhotoFormInitial()) {
    on<ProfilePhotoFormEvent>((event, emit) async {
      if (event is ProfilePhotoFormEventSelectPhoto) {
        emit(ProfilePhotoFormLoading());
        final image =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image != null) {
          emit(ProfilePhotoSelected(image: image));
        } else {
          emit(ProfilePhotoFormInitial());
        }
      }
      if (event is ProfilePhotoFormDeletePhoto) {
        emit(ProfilePhotoFormInitial());
      }
    });
  }
}
