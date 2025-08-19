// lib/bloc/internship/internship_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:login_page_flutter/config/app_config.dart';
import 'package:login_page_flutter/models/internship_entry.dart';
import 'package:login_page_flutter/services/httpStatusCodes.dart';

import 'internship_event.dart';
import 'internship_state.dart';

//part 'internship_bloc.freezed.dart';

class InternshipBloc extends Bloc<InternshipEvent, InternshipState> {
  final Dio _dio;

  InternshipBloc(this._dio) : super(const InternshipState.initial()) {
    on<FetchEntries>((event, emit) async {
      emit(const InternshipState.loading());
      try {
        // API'dan staj defteri girişlerini çekme
        final response = await _dio.get(
          '${AppConfig.baseUrl}/internship/entries',
          options: Options(headers: {'Accept': 'application/json'}),
        );

        final List<InternshipEntry> entries = (response.data['data'] as List)
            .map((e) => InternshipEntry.fromJson(e as Map<String, dynamic>))
            .toList();

        emit(InternshipState.loaded(entries: entries));
      } on DioException catch (e) {
        final errorMessage = e.response?.data['message'] ?? 'Girişler yüklenirken hata oluştu.';
        emit(InternshipState.error(message: errorMessage));
      }
    });

    on<AddEntry>((event, emit) async {
      // API'ya yeni bir staj defteri girişi ekleme
      emit(const InternshipState.loading());
      try {
        await _dio.post(
          '${AppConfig.baseUrl}/internship/entries',
          // Buradaki `data` parametresini değiştiriyoruz
          data: {
            'title': event.title,
            'description': event.description,
            'hours': event.hours,
            'date': event.date.toIso8601String(),
          },
          options: Options(headers: {'Accept': 'application/json'}),
        );
        // Yeni giriş eklendikten sonra listeyi yeniden çek
        add(const InternshipEvent.fetchEntries());
      } on DioException catch (e) {
        final errorMessage = e.response?.data['message'] ?? 'Giriş eklenirken hata oluştu.';
        emit(InternshipState.error(message: errorMessage));
      }
    });

    on<DeleteEntry>((event, emit) async {
      // API'dan bir staj defteri girişini silme
      emit(const InternshipState.loading());
      try {
        await _dio.delete(
          '${AppConfig.baseUrl}/internship/entries/${event.id}',
          options: Options(headers: {'Accept': 'application/json'}),
        );
        // Silme işleminden sonra listeyi yeniden çek
        add(const InternshipEvent.fetchEntries());
      } on DioException catch (e) {
        final errorMessage = e.response?.data['message'] ?? 'Giriş silinirken hata oluştu.';
        emit(InternshipState.error(message: errorMessage));
      }
    });
  }
}