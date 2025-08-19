// lib/bloc/internship/internship_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:login_page_flutter/models/internship_entry.dart';

part 'internship_state.freezed.dart';

@freezed
abstract class InternshipState with _$InternshipState {
  // Başlangıç durumu
  const factory InternshipState.initial() = InternshipInitial;
  // Veriler yüklenirken gösterilecek durum
  const factory InternshipState.loading() = InternshipLoading;
  // Veriler başarıyla yüklendiğinde, giriş listesini taşır
  const factory InternshipState.loaded({required List<InternshipEntry> entries}) = InternshipLoaded;
  // Bir hata oluştuğunda
  const factory InternshipState.error({required String message}) = InternshipError;
}