// lib/pages/new_password_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page_flutter/bloc/password_reset/password_reset_bloc.dart';
import 'package:login_page_flutter/pages/login_page.dart';
import 'package:login_page_flutter/widgets/custom_button.dart';
import 'package:login_page_flutter/widgets/custom_text_field.dart';

import 'package:login_page_flutter/controllers/form_controller.dart';

import '../bloc/auth/auth_bloc.dart';
import '../bloc/auth/auth_event.dart';


class NewPasswordPage extends StatefulWidget {
  final String email;

  const NewPasswordPage({Key? key, required this.email}) : super(key: key);

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  final TextEditingController codeController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final FormController _formController = FormController();

  String? _codeErrorText;
  String? _newPasswordErrorText;
  String? _confirmPasswordErrorText;


  @override
  void initState() {
    super.initState();
    codeController.addListener(_validateCode);
    newPasswordController.addListener(_validateNewPassword);
    confirmPasswordController.addListener(_validateConfirmPassword);
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

  void _validateNewPassword() {
    final result = _formController.formValid({
      "value": newPasswordController.text,
      "validators": [{"type": "empty"}, {"type": "len", "len": 8}]
    });
    setState(() {
      _newPasswordErrorText = result["status"] == "ok" ? null : result["message"];
      if (newPasswordController.text.isNotEmpty && confirmPasswordController.text.isNotEmpty && newPasswordController.text != confirmPasswordController.text) {
        _confirmPasswordErrorText = "Şifreler uyuşmuyor!";
      } else if (confirmPasswordController.text.isNotEmpty && newPasswordController.text == confirmPasswordController.text) {
        _confirmPasswordErrorText = null;
      }
    });
  }

  void _validateConfirmPassword() {
    final result = _formController.formValid({
      "value": confirmPasswordController.text,
      "validators": [{"type": "empty"}, {"type": "len", "len": 8}]
    });
    setState(() {
      _confirmPasswordErrorText = result["status"] == "ok" ? null : result["message"];
      if (newPasswordController.text.isNotEmpty && confirmPasswordController.text.isNotEmpty && newPasswordController.text != confirmPasswordController.text) {
        _confirmPasswordErrorText = "Şifreler uyuşmuyor!";
      } else if (confirmPasswordController.text.isNotEmpty && newPasswordController.text == confirmPasswordController.text) {
        _confirmPasswordErrorText = null;
      }
    });
  }


  @override
  void dispose() {
    codeController.removeListener(_validateCode);
    newPasswordController.removeListener(_validateNewPassword);
    confirmPasswordController.removeListener(_validateConfirmPassword);

    codeController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
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
        title: const Text('Şifre Sıfırlama Onayı'),
        backgroundColor: Colors.blue,
      ),
      body: BlocListener<PasswordResetBloc, PasswordResetState>(
        listener: (context, state) {
          state.whenOrNull(

            success: (message) {

              _showSnackBar(message, isError: false);

              context.read<AuthBloc>().add(const AuthEvent.resetRequested());

              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LoginPage()),
                    (Route<dynamic> route) => false,
              );
            },

            codeSentSuccess: (message, email) {
              _showSnackBar(message, isError: false);
            },

            error: (message) {
              _showSnackBar(message, isError: true);
            },
          );
        },
        child: BlocBuilder<PasswordResetBloc, PasswordResetState>(
          builder: (context, state) {
            final bool isResettingPassword = state is Loading; // İsimlendirme düzeltildi
            // `isResendingCode` kaldırıldı, bunun yerine doğrudan `isLoading` kullanılabilir
            final int remainingSeconds = (state is Cooldown) ? state.remainingSeconds : 0; // İsimlendirme düzeltildi

            final minutes = remainingSeconds ~/ 60;
            final seconds = remainingSeconds % 60;
            final countdownText = remainingSeconds > 0 ? '$minutes:${seconds.toString().padLeft(2, '0')}' : '';
            final bool canResendCode = remainingSeconds == 0 && !isResettingPassword; // Hata veren kısım düzeltildi: `isResendingCode` yerine `isResettingPassword` kullanıldı

            return Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.lock_reset, size: 100, color: Colors.blue),
                    const SizedBox(height: 30),
                    Text(
                      '${widget.email} adresinize gönderilen doğrulama kodunu ve yeni şifrenizi girin.',
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
                    const SizedBox(height: 20),
                    CustomTextField(
                      icon: Icons.lock,
                      autofocus: false,
                      label: "Yeni Şifre",
                      hint: "Yeni şifrenizi girin",
                      controller: newPasswordController,
                      errorText: _newPasswordErrorText,
                      isPassword: true,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      icon: Icons.lock,
                      autofocus: false,
                      label: "Yeni Şifre Tekrar",
                      hint: "Yeni şifrenizi tekrar girin",
                      controller: confirmPasswordController,
                      isPassword: true,
                      errorText: _confirmPasswordErrorText,
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      height: 42,
                      width: 180,
                      child: CustomButton(
                        text: isResettingPassword ? "Sıfırlanıyor..." : "Şifreyi Sıfırla",
                        onPressed: isResettingPassword ? null : () {
                          _validateCode();
                          _validateNewPassword();
                          _validateConfirmPassword();

                          if (_codeErrorText == null && _newPasswordErrorText == null && _confirmPasswordErrorText == null) {
                            context.read<PasswordResetBloc>().add(
                              PasswordResetEvent.resetPasswordWithCodeRequested( // Freezed event çağrısı düzeltildi
                                email: widget.email,
                                code: codeController.text.trim(),
                                newPassword: newPasswordController.text,
                                confirmPassword: confirmPasswordController.text,
                              ),
                            );
                          } else {
                            _showSnackBar("Lütfen tüm alanları doğru şekilde doldurun.", isError: true);
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 42,
                      width: 180,
                      child: CustomButton(
                        text: isResettingPassword // Buton metni için de isResettingPassword kullanılmalı
                            ? "Gönderiliyor..."
                            : (canResendCode ? "Kodu Yeniden Gönder" : "Yeniden Gönder ($countdownText)"),
                        onPressed: canResendCode ? () {
                          _showSnackBar("Kod yeniden gönderiliyor...", isError: false);
                          context.read<PasswordResetBloc>().add(
                            PasswordResetEvent.sendPasswordResetCodeRequested(email: widget.email), // Freezed event çağrısı düzeltildi
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