// lib/pages/password_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page_flutter/bloc/password_reset/password_reset_bloc.dart';
import 'package:login_page_flutter/pages/new_password_page.dart';
import 'package:login_page_flutter/widgets/custom_button.dart';
import 'package:login_page_flutter/widgets/custom_text_field.dart';

import 'package:login_page_flutter/controllers/form_controller.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({super.key});

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {

  final TextEditingController emailController = TextEditingController();
  final FormController _formController = FormController();

  String? _emailErrorText;

  @override
  void initState() {
    super.initState();

    context.read<PasswordResetBloc>().add(const PasswordResetEvent.loadPasswordResetCooldown()); // Freezed event çağrısı
    emailController.addListener(_validateEmail);
  }

  void _validateEmail() {

    final result = _formController.formValid({
      "value": emailController.text,
      "validators": [{"type": "empty"}, {"type": "email"}]
    });

    setState(() {
      _emailErrorText = result["status"] == "ok" ? null : result["message"];
    });
  }

  @override
  void dispose() {

    emailController.removeListener(_validateEmail);
    emailController.dispose();

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

      resizeToAvoidBottomInset: false,

      appBar: AppBar(
        title: const Text('Şifremi Unuttum'),
        backgroundColor: Colors.blue,
      ),

      body: BlocListener<PasswordResetBloc, PasswordResetState>(

        listener: (context, state) {

          state.maybeWhen(

              codeSentSuccess: (message, email) { // İsimlendirme düzeltildi
                _showSnackBar(message, isError: false);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewPasswordPage(email: email),
                  ),
                );
              },


              error: (message) {
                _showSnackBar(message, isError: true);
              },
              cooldown: (remainingSeconds, cooldownEmail) {
                emailController.text = cooldownEmail;
              },


              initial: () {
                emailController.clear();
                setState(() {
                  _emailErrorText = null;
                });
              },

              orElse: () => null,
          );
        },

        child: BlocBuilder<PasswordResetBloc, PasswordResetState>(

          builder: (context, state) {

            final bool isLoading = state is Loading;
            final bool isEmailReadOnly = state is Cooldown;
            final int remainingSeconds = (state is Cooldown) ? state.remainingSeconds : 0;
            final String cooldownEmail = (state is Cooldown) ? state.cooldownEmail : '';

            final minutes = remainingSeconds ~/ 60;
            final seconds = remainingSeconds % 60;
            final countdownText = remainingSeconds > 0 ? '$minutes:${seconds.toString().padLeft(2, '0')}' : '';

            final bool isEmailValidForSubmit = _emailErrorText == null && emailController.text.isNotEmpty;
            final bool canProceedToNewPasswordPage = isEmailReadOnly && emailController.text.isNotEmpty && emailController.text == cooldownEmail;

            return Center(
              child: SingleChildScrollView(

                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),

                child: Column(

                  mainAxisSize: MainAxisSize.min,

                  children: [

                    Container(

                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: const BorderRadius.all(Radius.circular(20)),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 15,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),

                      child: const Icon(Icons.lock_reset, size: 150, color: Colors.blue),
                    ),

                    Container(

                      margin: const EdgeInsets.only(top: 80, left: 10, right: 10),

                      child: CustomTextField(
                        icon: Icons.mail,
                        label: "Email",
                        autofocus: false,
                        isPassword: false,
                        errorText: _emailErrorText,
                        hint: "example@gmail.com",
                        controller: emailController,
                        readOnly: isEmailReadOnly,
                      ),
                    ),

                    if (remainingSeconds > 0)
                      Padding(

                        padding: const EdgeInsets.only(top: 10.0),

                        child: Text(
                          'Yeni kod göndermek için kalan süre: $countdownText',
                          style: const TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ),

                    Container(
                      height: 42,
                      width: 120,
                      margin: const EdgeInsets.symmetric(vertical: 60),

                      child: CustomButton(
                        text: isLoading
                            ? "Gönderiliyor..."
                            : (remainingSeconds > 0 ? "İleri Git" : "Gönder"),
                        onPressed: isLoading
                            ? null
                            : () {

                          if (remainingSeconds > 0) {

                            if (canProceedToNewPasswordPage) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NewPasswordPage(email: emailController.text.trim()),
                                ),
                              );

                            } else {

                              _showSnackBar("Cooldown süresi boyunca sadece aynı e-posta ile ilerleyebilirsiniz.", isError: true);
                            }

                          } else {

                            _validateEmail();

                            if (isEmailValidForSubmit) {

                              context.read<PasswordResetBloc>().add(
                                PasswordResetEvent.sendPasswordResetCodeRequested(email: emailController.text.trim()), // Freezed event çağrısı
                              );

                            } else {

                              _showSnackBar("Lütfen geçerli bir e-posta adresi girin.", isError: true);
                            }
                          }
                        },
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