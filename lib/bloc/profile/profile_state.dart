// lib/bloc/profile/profile_state.dart
part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  // Başlangıç durumu
  const factory ProfileState.initial() = _Initial;

  // İşlem devam ederken (şifre değiştirme veya güncelleme)
  const factory ProfileState.loading() = _Loading;

  // İşlem başarılı olduğunda, kullanıcı bilgilerini taşır
  const factory ProfileState.loaded({
    required Map<String, dynamic> user,
    String? message,
  }) = _Loaded;

  // Bir hata oluştuğunda
  const factory ProfileState.error({required String message}) = _Error;
}