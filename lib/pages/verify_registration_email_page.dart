// lib/pages/verify_registration_email_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page_flutter/bloc/email_verification/email_verification_bloc.dart';
import 'package:login_page_flutter/pages/login_page.dart';
import 'package:login_page_flutter/widgets/custom_button.dart';
import 'package:login_page_flutter/widgets/custom_text_field.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:login_page_flutter/controllers/form_controller.dart';

// AuthBloc importunu ekliyoruz
import 'package:login_page_flutter/bloc/auth/auth_bloc.dart';
import 'package:login_page_flutter/bloc/auth/auth_event.dart';

class VerifyRegistrationEmailPage extends StatefulWidget {

  final String email;
  final String name;
  final String password;
  final String passwordConfirmation;


  const VerifyRegistrationEmailPage({
    Key? key,
    required this.email,
    required this.name,
    required this.password,
    required this.passwordConfirmation,
  }) : super(key: key);

  @override
  State<VerifyRegistrationEmailPage> createState() => _VerifyRegistrationEmailPageState();
}

class _VerifyRegistrationEmailPageState extends State<VerifyRegistrationEmailPage> {

  final TextEditingController codeController = TextEditingController();
  final FormController _formController = FormController();

  String? _codeErrorText;

  @override
  void initState() {
    super.initState();

    codeController.addListener(_validateCode);
  }

  void _validateCode() {

    final result = _formController.formValid({
      "value": codeController.text,
      "validators": [{"type": "empty"}, {"type": "len", "len": 6}]
    });

    setState(() {
      _codeErrorText = result["status"] == "ok" ? null : result["message"];
    });
  }

  @override
  void dispose() {

    codeController.removeListener(_validateCode);
    codeController.dispose();

    super.dispose();
  }

  void _showSnackBar(String message, {bool isError = true}) {

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('E-posta Doğrulama'),
        backgroundColor: Colors.blue,
      ),

      body: BlocListener<EmailVerificationBloc, EmailVerificationState>(

        listener: (context, state) {

          state.maybeWhen(

            success: (message) {
              _showSnackBar(message, isError: false);


              // Email doğrulaması başarılı olduğunda AuthBloc'un durumunu sıfırla.
              context.read<AuthBloc>().add(const AuthEvent.resetRequested());

              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LoginPage()),
                    (Route<dynamic> route) => false,
              );
            },

            error: (message) {
              _showSnackBar(message, isError: true);
            },
            cooldown: (remainingSeconds) {},

            orElse: () => null,

          );
        },

        child: BlocBuilder<EmailVerificationBloc, EmailVerificationState>(

          builder: (context, state) {

            final int remainingSeconds = (state is Cooldown) ? state.remainingSeconds : 0;
            final bool isVerifying = state is Loading;
            final bool canResendCode = remainingSeconds == 0 && !isVerifying;

            final minutes = remainingSeconds ~/ 60;
            final seconds = remainingSeconds % 60;
            final countdownText = remainingSeconds > 0 ? '$minutes:${seconds.toString().padLeft(2, '0')}' : '';

            return Center(

              child: SingleChildScrollView(

                padding: const EdgeInsets.all(20.0),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    const Icon(Icons.verified_user, size: 100, color: Colors.blue),
                    const SizedBox(height: 30),

                    Text(
                      '${widget.email} adresinize bir doğrulama kodu gönderildi. Lütfen kodu girin.',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    ),

                    const SizedBox(height: 10),

                    if (remainingSeconds > 0)
                      Text(
                        'Yeni kod göndermek için kalan süre: $countdownText',
                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                      ),

                    const SizedBox(height: 30),

                    CustomTextField(
                      icon: Icons.vpn_key,
                      label: "Doğrulama Kodu",
                      hint: "E-postanıza gelen kodu girin",
                      controller: codeController,
                      autofocus: true,
                      isPassword: false,
                      errorText: _codeErrorText,
                    ),

                    const SizedBox(height: 40),

                    SizedBox(
                      height: 42,
                      width: 180,

                      child: CustomButton(
                        text: isVerifying ? "Doğrulanıyor..." : "Hesabı Doğrula",
                        onPressed: isVerifying ? null : () async {
                          _validateCode();

                          if (_codeErrorText == null) {

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

                              print("Cihaz adı alınırken hata oluştu (Verify Email): $e");
                            }

                            context.read<EmailVerificationBloc>().add(
                              EmailVerificationEvent.verifyEmailRequested(
                                name: widget.name,
                                email: widget.email,
                                password: widget.password,
                                passwordConfirmation: widget.passwordConfirmation,
                                code: codeController.text.trim(),
                                deviceName: deviceName,
                              ),
                            );

                          } else {
                            _showSnackBar("Lütfen doğrulama kodunu girin.", isError: true);
                          }
                        },
                      ),
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      height: 42,
                      width: 180,
                      child: CustomButton(
                        text: isVerifying
                            ? "Gönderiliyor..."
                            : (canResendCode ? "Kodu Yeniden Gönder" : "Yeniden Gönder ($countdownText)"),

                        onPressed: canResendCode ? () async {
                          _showSnackBar("Kod yeniden gönderiliyor...", isError: false);
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

                            print("Cihaz adı alınırken hata oluştu (Resend Email): $e");
                          }

                          context.read<EmailVerificationBloc>().add(
                            EmailVerificationEvent.resendVerificationCodeRequested(
                              name: widget.name,
                              email: widget.email,
                              password: widget.password,
                              passwordConfirmation: widget.passwordConfirmation,
                              deviceName: deviceName,
                            ),
                          );
                        } : null,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}