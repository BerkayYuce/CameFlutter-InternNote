// lib/bloc/internship/internship_event.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'internship_event.freezed.dart';

@freezed
abstract class InternshipEvent with _$InternshipEvent {
  // Staj defteri girişlerini API'dan çekmek için olay
  const factory InternshipEvent.fetchEntries() = FetchEntries;
  // Yeni bir giriş eklemek için olay
  const factory InternshipEvent.addEntry({
    required String title,
    required String description,
    required int hours,
    required DateTime date,
  }) = AddEntry;
  // Var olan bir girişi silmek için olay
  const factory InternshipEvent.deleteEntry({required String id}) = DeleteEntry;
}