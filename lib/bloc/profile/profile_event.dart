// lib/bloc/profile/profile_event.dart
part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  // Kullanıcının profil bilgilerini almak için bir olay (event)
  const factory ProfileEvent.profileInfoRequested() = _ProfileInfoRequested;

  // Şifre değiştirme isteğini başlatmak için bir olay (event)
  const factory ProfileEvent.passwordChangeRequested({
    required String oldPassword,
    required String newPassword,
  }) = _PasswordChangeRequested;

  // Profil bilgilerini güncelleme isteğini başlatmak için bir olay (event)
  const factory ProfileEvent.profileUpdateRequested({
    required String name,
    required String email,
  }) = _ProfileUpdateRequested;
}