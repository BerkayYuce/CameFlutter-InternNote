// lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

// Bloc importları
import 'package:login_page_flutter/bloc/auth/auth_bloc.dart';
import 'package:login_page_flutter/bloc/email_verification/email_verification_bloc.dart';
import 'package:login_page_flutter/bloc/password_reset/password_reset_bloc.dart';

// Sayfa importları
import 'package:login_page_flutter/pages/home_page.dart';
import 'package:login_page_flutter/pages/login_page.dart';
import 'package:login_page_flutter/pages/register_page.dart';
import 'package:login_page_flutter/pages/verify_registration_email_page.dart';
import 'package:login_page_flutter/pages/password_page.dart';

// Config ve Services importları
import 'package:login_page_flutter/config/app_config.dart';
import 'package:login_page_flutter/services/httpStatusCodes.dart';

// AuthBloc Event ve State importları
import 'package:login_page_flutter/bloc/auth/auth_event.dart';
import 'package:login_page_flutter/bloc/auth/auth_state.dart';

import '../bloc/internship/internship_event.dart';
import '../bloc/profile/profile_bloc.dart';
import 'package:login_page_flutter/bloc/internship/internship_bloc.dart';


// Hata ayıklama için BlocObserver
class SimpleBlocObserver extends BlocObserver {

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('🔵 onEvent ${bloc.runtimeType}: $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('🟢 onTransition ${bloc.runtimeType}: ${transition.currentState} -> ${transition.nextState}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('🔴 onError ${bloc.runtimeType}: $error, $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}



void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: AppConfig.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  final SharedPreferences prefs = await SharedPreferences.getInstance();


  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        final authToken = prefs.getString('authToken');
        if (authToken != null) {
          options.headers['Authorization'] = 'Bearer $authToken';
          print('✅ Dio Interceptor: Authorization token added to request headers.');
        }
        return handler.next(options);
      },
      onError: (DioException e, handler) async {
        if (e.response?.statusCode == 401) {
          // Token süresi dolduysa veya geçersizse kullanıcıyı çıkışa zorla
          await prefs.remove('authToken');
          await prefs.remove('remember_me_token');
        }
        return handler.next(e);
      },
    ),
  );



  String deviceName = 'unknown_device';

  try {

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (defaultTargetPlatform == TargetPlatform.android) {

      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceName = androidInfo.model;

    } else if (defaultTargetPlatform == TargetPlatform.iOS) {

      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceName = iosInfo.name;

    } else {

      deviceName = 'flutter_app_desktop';
    }

  } catch (e) {

    print("Cihaz adı alınırken hata oluştu: $e");
  }

  runApp(
    MultiBlocProvider(

      providers: [

        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(dio, prefs),
        ),

        BlocProvider<InternshipBloc>(
          create: (context) => InternshipBloc(dio),
        ),


        BlocProvider<EmailVerificationBloc>(
          create: (context) => EmailVerificationBloc(dio),
        ),


        BlocProvider<PasswordResetBloc>(
          create: (context) => PasswordResetBloc(dio, prefs),
        ),


        BlocProvider<ProfileBloc>(
          create: (context) => ProfileBloc(dio, prefs),
        ),

      ],

      child: MyApp(deviceName: deviceName, prefs: prefs),
    ),
  );
}



class MyApp extends StatefulWidget {

  final String deviceName;
  final SharedPreferences prefs;

  const MyApp({
    super.key,
    required this.deviceName,
    required this.prefs,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {

    super.initState();
    final authBloc = context.read<AuthBloc>();
    final rememberToken = widget.prefs.getString('remember_me_token') ?? '';

    if (rememberToken.isNotEmpty) {

      print('🚀 MyApp: Dispatching AutoLoginRequested with token.');

      authBloc.add(AuthEvent.autoLoginRequested(

        rememberToken: rememberToken,
        deviceName: widget.deviceName,
      ));

    } else {

      print('🚀 MyApp: No rememberToken found. AuthBloc remains AuthInitial.');
      //Token yoksa durum AuthInitial olarak kalır ve LoginPage gösterilir.
      //Bu durumda AuthBloca reset eventi göndermeye gerek yoktur.

    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ana Sayfa',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeWhen(

            success: (message, authToken, rememberMeToken, user) {
              // Giriş başarılı olduğunda, InternshipBloc'a girişleri getirmesi için bir olay gönderiyoruz.
              context.read<InternshipBloc>().add(const InternshipEvent.fetchEntries());
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message), backgroundColor: Colors.green),
              );
            },

            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message), backgroundColor: Colors.red),
              );
            },
            emailVerificationRequired: (name, email, password, passwordConfirmation, message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message), backgroundColor: Colors.orange),
              );
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => VerifyRegistrationEmailPage(
                    email: email,
                    name: name,
                    password: password,
                    passwordConfirmation: passwordConfirmation,
                  ),
                ),
              );
            },
            orElse: () => null,
          );
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return state.maybeWhen(
              success: (message, authToken, rememberMeToken, user) {
                // Giriş başarılıysa HomePage'i göster.
                return const HomePage();
              },
              orElse: () {
                // Varsayılan olarak LoginPage'i göster.
                // Bu, AuthInitial, Loading, Error gibi tüm durumlar için geçerlidir.
                return const LoginPage();
              },
            );
          },
        ),
      ),
    );
  }
}

