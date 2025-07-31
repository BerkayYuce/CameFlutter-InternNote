import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

import 'package:login_page_flutter/bloc/auth/auth_event.dart';
import 'package:login_page_flutter/bloc/auth/auth_state.dart';
import 'package:login_page_flutter/config/app_config.dart';
import 'package:login_page_flutter/services/httpStatusCodes.dart';



class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final Dio _dio;
  final SharedPreferences _prefs;

  AuthBloc(this._dio, this._prefs) : super(const AuthInitial()) {
    on<LoginRequested>((event, emit) => _onLoginRequested(event, emit));
    on<RegisterRequested>((event, emit) => _onRegisterRequested(event, emit));
    on<AutoLoginRequested>((event, emit) => _onAutoLoginRequested(event, emit));
    on<LogoutRequested>((event, emit) => _onLogoutRequested(event, emit));
    on<ResetRequested>((event, emit) => _onResetRequested(event, emit));

  }


  Future<void> _onResetRequested(ResetRequested event, Emitter<AuthState> emit) async {
    print('🔄 AuthBloc: ResetRequested event received. Emitting AuthInitial.');
    emit(const AuthInitial());
  }


  Future<void> _onLoginRequested(LoginRequested event, Emitter<AuthState> emit) async {

    print('🔶 AuthBloc: Login event received. Emitting AuthLoading.');
    emit(const AuthLoading());

    try {

      print('⏩ AuthBloc: Attempting to login with email: ${event.email}');

      final response = await _dio.post(

        '${AppConfig.baseUrl}/login',

        data: {
          'email': event.email,
          'password': event.password,
          'device_name': event.deviceName,
          'remember': event.rememberMe,
        },
      );

      print('✅ AuthBloc: Login API Response received: ${response.statusCode}');
      print('✅ AuthBloc: Response Data: ${response.data}');

      final String? authToken = response.data['token'];
      final String? rememberToken = response.data['remember_token'];
      final Map<String, dynamic>? userData = response.data['user'];


      if (authToken != null) {

        await _prefs.setString('authToken', authToken);

        if (event.rememberMe && rememberToken != null) {

          await _prefs.setString('remember_me_token', rememberToken);
          print('✅ AuthBloc: Remember me token saved: $rememberToken');

        } else {

          await _prefs.remove('remember_me_token');
          print('✅ AuthBloc: Remember me token removed.');
        }

        print('🟢 AuthBloc: Emitting AuthSuccess state.');

        emit(AuthSuccess(
          message: response.data['message'] ?? 'Giriş başarılı!',
          authToken: authToken,
          rememberMeToken: rememberToken,
          user: userData,
        ));

        print('🟢 AuthBloc: AuthSuccess state emitted.');

      } else {

        print('❌ AuthBloc: Auth token is null in response. Emitting AuthError.');
        emit(const AuthError(message: 'Giriş tokenı alınamadı.'));
      }


    } on DioException catch (e) {

      String errorMessage = "Bir hata oluştu.";
      print('🔴 AuthBloc: DioException caught: ${e.type}');

      await _prefs.remove('authToken');
      await _prefs.remove('remember_me_token');

      if (e.response != null) {

        print('🔴 AuthBloc: DioError Response Status: ${e.response?.statusCode}');
        print('🔴 AuthBloc: DioError Response Data: ${e.response?.data}');

        if (e.response!.data != null && e.response!.data is Map && e.response!.data.containsKey('message')) {

          errorMessage = e.response!.data['message'];
        }
        else if (e.response!.statusCode == 422 && e.response!.data != null && e.response!.data is Map && e.response!.data.containsKey('errors')) {

          Map<String, dynamic> errors = e.response!.data['errors'];

          if (errors.isNotEmpty) {
            errorMessage = (errors.values.first is List && (errors.values.first as List).isNotEmpty)
                ? (errors.values.first as List).first.toString()
                : (errors.values.first is String ? errors.values.first.toString() : "Doğrulama hatası.");
          }
        }
        else if (e.response!.statusCode == 401) {

          errorMessage = "Kullanıcı adı veya şifre yanlış.";
        }
        else if (e.response!.statusCode != null) {

          errorMessage = "Sunucu hatası: ${e.response!.statusCode} - ${HttpStatusCodes.getMessage(e.response!.statusCode!)}";
        }
      } else {
        if (e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout || e.type == DioExceptionType.sendTimeout || e.type == DioExceptionType.connectionError || e.type == DioExceptionType.unknown) {

          errorMessage = "Sunucuya bağlanılamıyor. Lütfen internet bağlantınızı ve sunucunun açık olup olmadığını kontrol edin.";
        } else {

          errorMessage = 'Beklenmedik bir bağlantı hatası oluştu: ${e.message}';
        }
      }

      print('🔴 AuthBloc: Emitting AuthError: $errorMessage');
      emit(AuthError(message: errorMessage));

    } catch (e, stacktrace) {
      print('🔥 AuthBloc: Unexpected Exception: $e');
      print('🔥 AuthBloc: Stacktrace: $stacktrace');

      emit(AuthError(message: 'Beklenmedik bir hata oluştu: ${e.toString()}'));
    }
  }


  Future<void> _onRegisterRequested(RegisterRequested event, Emitter<AuthState> emit) async {

    emit(const AuthLoading());

    try {

      final response = await _dio.post(

        '${AppConfig.baseUrl}/register',

        data: {
          'name': event.name,
          'email': event.email,
          'password': event.password,
          'password_confirmation': event.passwordConfirmation,
          'device_name': event.deviceName,
        },
        options: Options(
          headers: {'Accept': 'application/json'},
        ),
      );

      print('✅ AuthBloc: Register API Response received: ${response.statusCode}');
      print('✅ AuthBloc: Register Response Data: ${response.data}');

      if (response.statusCode == 200) {

        emit(AuthEmailVerificationRequired(
          name: event.name,
          email: event.email,
          password: event.password,
          passwordConfirmation: event.passwordConfirmation,
          message: response.data['message'] ?? "Doğrulama kodu e-posta adresinize gönderildi. Lütfen gelen kutunuzu kontrol edin ve e-postanızı doğrulayın.",
        ));

      } else {

        String errorMessage = response.data['message'] ?? "Kayıt başarısız oldu.";
        emit(AuthError(message: errorMessage));
      }
    } on DioException catch (e) {

      String errorMessage = "Bir hata oluştu.";
      print('🔴 AuthBloc: Register DioException caught: ${e.type}');

      if (e.response != null) {

        print('🔴 AuthBloc: Register DioError Response Status: ${e.response?.statusCode}');
        print('🔴 AuthBloc: Register DioError Response Data: ${e.response?.data}');

        if (e.response!.data != null && e.response!.data is Map && e.response!.data.containsKey('message')) {

          errorMessage = e.response!.data['message'];
        } else if (e.response!.statusCode == 422 && e.response!.data != null && e.response!.data is Map && e.response!.data.containsKey('errors')) {

          Map<String, dynamic> errors = e.response!.data['errors'];

          if (errors.isNotEmpty && errors.values.first is List && (errors.values.first as List).isNotEmpty) {

            errorMessage = (errors.values.first as List).first.toString();
          } else if (errors.isNotEmpty && errors.values.first is String) {

            errorMessage = errors.values.first.toString();
          }
        } else if (e.response!.statusCode != null) {

          errorMessage = "Sunucu hatası: ${e.response!.statusCode} - ${HttpStatusCodes.getMessage(e.response!.statusCode!)}";
        }
      } else {
        if (e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout || e.type == DioExceptionType.sendTimeout || e.type == DioExceptionType.connectionError) {

          errorMessage = "Sunucuya bağlanılamıyor. Lütfen internet bağlantınızı kontrol edin.";
        } else {

          errorMessage = 'Beklenmedik bir bağlantı hatası oluştu: ${e.message}';
        }
      }
      print('🔴 AuthBloc: Emitting AuthError for Register: $errorMessage');

      emit(AuthError(message: errorMessage));
    } catch (e) {

      print('🔥 AuthBloc: Unexpected Exception for Register: $e');

      emit(AuthError(message: 'Beklenmedik bir hata oluştu: ${e.toString()}'));
    }
  }


  Future<void> _onAutoLoginRequested(AutoLoginRequested event, Emitter<AuthState> emit) async {

    if (event.rememberToken.isEmpty) {

      print('🔶 AuthBloc: AutoLoginRequested received with empty token. Emitting AuthInitial directly.');

      emit(const AuthInitial());
      return;
    }

    print('🔶 AuthBloc: AutoLoginRequested received with token. Emitting AuthLoading.');
    emit(const AuthLoading());

    try {

      String currentDeviceName = event.deviceName;

      if (currentDeviceName == 'unknown_device' || currentDeviceName.isEmpty) {

        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

        if (defaultTargetPlatform == TargetPlatform.android) {

          AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
          currentDeviceName = androidInfo.model;

        } else if (defaultTargetPlatform == TargetPlatform.iOS) {

          IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
          currentDeviceName = iosInfo.name;

        } else {

          currentDeviceName = 'flutter_app_desktop';
        }
      }

      final response = await _dio.post(

        '${AppConfig.baseUrl}/auto-login',

        data: {
          'remember_token': event.rememberToken,
          'device_name': currentDeviceName,
        },
      );

      print('✅ AuthBloc: AutoLogin API Response received: ${response.statusCode}');
      print('✅ AuthBloc: AutoLogin Response Data: ${response.data}');

      if (response.statusCode == 200) {

        final String? authToken = response.data['token'];
        final String? newRememberToken = response.data['remember_token'];
        final Map<String, dynamic>? userData = response.data['user'];

        if (authToken != null) {

          await _prefs.setString('authToken', authToken);

          if (newRememberToken != null) {

            await _prefs.setString('remember_me_token', newRememberToken);
            print('✅ AuthBloc: New Remember me token saved: $newRememberToken');
          }

          print('🟢 AuthBloc: Emitting AuthSuccess state for AutoLogin.');

          emit(AuthSuccess(
            message: 'Otomatik giriş başarılı!',
            authToken: authToken,
            rememberMeToken: newRememberToken ?? event.rememberToken,
            user: userData,
          ));

          print('🟢 AuthBloc: AuthSuccess state emitted for AutoLogin.');

        } else {

          print('❌ AuthBloc: AutoLogin token is null. Emitting AuthError.');

          await _prefs.remove('authToken');
          await _prefs.remove('remember_me_token');

          emit(const AuthError(message: 'Otomatik giriş tokenı alınamadı.'));
        }
      } else {

        print('❌ AuthBloc: AutoLogin failed with status: ${response.statusCode}');

        await _prefs.remove('authToken');
        await _prefs.remove('remember_me_token');

        String errorMessage = response.data['message'] ?? HttpStatusCodes.getMessage(response.statusCode!);
        emit(AuthError(message: errorMessage));
      }

    } on DioException catch (e) {

      print('🔴 AuthBloc: AutoLogin DioException caught: ${e.type}');

      await _prefs.remove('authToken');
      await _prefs.remove('remember_me_token');

      String errorMessage = 'Otomatik giriş sırasında bir hata oluştu. Lütfen internet bağlantınızı kontrol edin.';

      if (e.response != null) {

        print('🔴 AuthBloc: AutoLogin DioError Response Status: ${e.response?.statusCode}');
        print('🔴 AuthBloc: AutoLogin DioError Response Data: ${e.response?.data}');
        errorMessage = e.response!.data['message'] ?? HttpStatusCodes.getMessage(e.response!.statusCode!);
      }

      print('🔴 AuthBloc: Emitting AuthError for AutoLogin: $errorMessage');

      emit(AuthError(message: errorMessage));

    } catch (e) {

      print('🔥 AuthBloc: Unexpected Exception for AutoLogin: $e');

      await _prefs.remove('authToken');
      await _prefs.remove('remember_me_token');
      emit(AuthError(message: 'Beklenmedik bir hata oluştu: ${e.toString()}'));

    }
  }


  Future<void> _onLogoutRequested(LogoutRequested event, Emitter<AuthState> emit) async {

    print('🔶 AuthBloc: Logout event received. Emitting AuthLoading.');

    emit(const AuthLoading());

    try {

      final String? authToken = _prefs.getString('authToken');

      if (authToken != null) {

        final response = await _dio.post(

          '${AppConfig.baseUrl}/logout',

          options: Options(
            headers: {
              'Authorization': 'Bearer $authToken',
              'Accept': 'application/json',
            },
          ),
        );
        print('✅ AuthBloc: Logout API call successful. Status: ${response.statusCode}');

      } else {

        print('⚠️ AuthBloc: No authToken found for logout. Proceeding with local logout.');
      }

      await _prefs.remove('authToken');
      await _prefs.remove('remember_me_token');

      print('🟢 AuthBloc: Auth token and remember me token removed from local storage.');

      print('🟢 AuthBloc: Emitting AuthInitial state after successful logout.');

      emit(const AuthInitial()); // Burası çok kritik!

    } on DioException catch (e) {

      print('🔴 AuthBloc: Logout DioException caught: ${e.type}');

      await _prefs.remove('authToken');
      await _prefs.remove('remember_me_token');

      String errorMessage = 'Çıkış sırasında bir hata oluştu: ${e.response?.data['message'] ?? e.message}';
      print('🔴 AuthBloc: Emitting AuthError for Logout: $errorMessage');

      emit(AuthError(message: errorMessage));

      print('🔴 AuthBloc: Emitting AuthInitial state after logout error for redirection.');
      emit(const AuthInitial());

    } catch (e) {

      print('🔥 AuthBloc: Unexpected Exception during Logout: $e');

      await _prefs.remove('authToken');
      await _prefs.remove('remember_me_token');

      emit(AuthError(message: 'Çıkış sırasında bilinmeyen bir hata oluştu: ${e.toString()}'));
      emit(const AuthInitial());
    }
  }
}