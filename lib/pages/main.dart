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


        BlocProvider<EmailVerificationBloc>(
          create: (context) => EmailVerificationBloc(dio),
        ),


        BlocProvider<PasswordResetBloc>(
          create: (context) => PasswordResetBloc(dio, prefs),
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,

      initialRoute: '/',

      onGenerateRoute: (settings) {
        Widget page;

        switch (settings.name) {
          case '/':
            page = const LoginPage();
            break;
          case '/home':
            page = const HomePage();
            break;
          case '/register':
            page = const RegisterPage();
            break;
          case '/password':
            page = const PasswordPage();
            break;
          case '/verify-email':

            final args = settings.arguments as Map<String, dynamic>?;

            page = VerifyRegistrationEmailPage(
              email: args?['email'] ?? '',
              name: args?['name'] ?? '',
              password: args?['password'] ?? '',
              passwordConfirmation: args?['passwordConfirmation'] ?? '',
            );

            break;

          default:
          // Bilinmeyen bir rota geldiğinde varsayılan olarak LoginPage'e yönlendirme
            print('⚠️ main.dart: Unknown route: ${settings.name}. Defaulting to LoginPage.');

            page = const LoginPage();
            break;
        }

        return MaterialPageRoute(
          builder: (routeContext) {

            return BlocListener<AuthBloc, AuthState>(

              listener: (listenerContext, state) {

                print('✅ main.dart listener: Received state: ${state.runtimeType}');

                // listener: maybeWhen ile yan etkileri yönetme
                state.maybeWhen(
                  success: (message, authToken, rememberMeToken, user) {
                    print('🎉 main.dart Listener: AuthSuccess state received! Message: $message');
                    ScaffoldMessenger.of(listenerContext).showSnackBar(
                      SnackBar(content: Text(message), backgroundColor: Colors.green),
                    );
                    print('🎉 main.dart Listener: Navigating to HomePage via named route and clearing stack.');
                    Navigator.of(listenerContext).pushNamedAndRemoveUntil('/home', (route) => false);
                  },

                  error: (message) {
                    print('🔴 main.dart Listener: AuthError state received! Message: $message');
                    ScaffoldMessenger.of(listenerContext).showSnackBar(
                      SnackBar(content: Text(message), backgroundColor: Colors.red),
                    );
                    print('🔴 main.dart Listener: Navigating to LoginPage due to error via named route and clearing stack.');
                    Navigator.of(listenerContext).pushNamedAndRemoveUntil('/', (route) => false);
                  },

                  emailVerificationRequired: (name, email, password, passwordConfirmation, message) {
                    print('🟡 main.dart Listener: EmailVerificationRequired state received! Message: $message');
                    ScaffoldMessenger.of(listenerContext).showSnackBar(
                      SnackBar(content: Text(message), backgroundColor: Colors.orange),
                    );
                    print('🟡 main.dart Listener: Navigating to verify-email page via named route.');
                    Navigator.of(listenerContext).pushReplacementNamed(
                      '/verify-email',
                      arguments: {
                        'email': email,
                        'name': name,
                        'password': password,
                        'passwordConfirmation': passwordConfirmation,
                      },
                    );
                  },

                  initial: () {
                    print('🔄 main.dart Listener: AuthInitial state received. Ensuring navigation to root.');
                    // Koşulu kaldırarak veya sadeleştirerek her zaman giriş sayfasına yönlendir.
                    // Bu, logout sonrası her zaman login ekranına dönmenizi sağlar.
                    Navigator.of(listenerContext).pushNamedAndRemoveUntil('/', (route) => false);
                  },
                  loading: () {
                    print('⏳ main.dart Listener: AuthLoading state received. No explicit navigation.');
                  },
                  orElse: () {
                    print('🤔 main.dart Listener: Unhandled state in maybeWhen: ${state.runtimeType}. No action taken.');
                  },
                );
              },

              child: page,
            );
          },
          settings: settings,
        );
      },
    );
  }
}