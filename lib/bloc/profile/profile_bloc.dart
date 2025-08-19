// lib/bloc/profile/profile_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {

  final Dio _dio;
  final SharedPreferences _prefs;

  ProfileBloc(this._dio, this._prefs) : super(const ProfileState.initial()) {


    on<_ProfileInfoRequested>((event, emit) async {

      emit(const ProfileState.loading());

      try {

        final token = _prefs.getString('authToken');

        if (token == null) {
          emit(const ProfileState.error(message: "Oturum açık değil."));
          return;
        }


        final response = await _dio.get(

          '/user/profile',

          options: Options(headers: {'Authorization': 'Bearer $token'}),
        );

        final user = response.data;

        emit(ProfileState.loaded(user: user));

      } on DioException catch (e) {

        emit(ProfileState.error(message: e.response?.data['message'] ?? "Profil bilgisi alınırken bir hata oluştu."));
      }
    });


    on<_PasswordChangeRequested>((event, emit) async {

      emit(const ProfileState.loading());

      try {

        final token = _prefs.getString('authToken');

        if (token == null) {

          emit(const ProfileState.error(message: "Oturum açık değil."));
          return;
        }


        await _dio.post(

          '/user/change-password',

          data: {
            'old_password': event.oldPassword,
            'new_password': event.newPassword,
          },

          options: Options(headers: {'Authorization': 'Bearer $token'}),
        );

        emit(const ProfileState.loaded(

          user: {}, // Veya mevcut kullanıcı verisi
          message: "Şifre başarıyla değiştirildi!",
        ));

      } on DioException catch (e) {

        emit(ProfileState.error(message: e.response?.data['message'] ?? "Şifre değiştirilirken bir hata oluştu."));
      }
    });


    on<_ProfileUpdateRequested>((event, emit) async {

      emit(const ProfileState.loading());

      try {

        final token = _prefs.getString('authToken');

        if (token == null) {

          emit(const ProfileState.error(message: "Oturum açık değil."));
          return;
        }


        final response = await _dio.put(

          '/user/profile',

          data: {
            'name': event.name,
            'email': event.email,
          },

          options: Options(headers: {'Authorization': 'Bearer $token'}),
        );

        final updatedUser = response.data;

        emit(ProfileState.loaded(
          user: updatedUser,
          message: "Profil başarıyla güncellendi!",
        ));

      } on DioException catch (e) {

        emit(ProfileState.error(message: e.response?.data['message'] ?? "Profil güncellenirken bir hata oluştu."));
      }
    });
  }
}