import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page_flutter/bloc/auth/auth_bloc.dart';
import 'package:login_page_flutter/bloc/auth/auth_event.dart';
import 'package:login_page_flutter/bloc/auth/auth_state.dart';
import 'package:login_page_flutter/pages/verify_registration_email_page.dart';
import 'package:login_page_flutter/widgets/custom_button.dart';
import 'package:login_page_flutter/widgets/custom_text_field.dart';
import 'package:login_page_flutter/controllers/form_controller.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final FormController _formController = FormController();

  String? _nameErrorText;
  String? _emailErrorText;
  String? _passwordErrorText;
  String? _confirmPasswordErrorText;

  @override
  void initState() {
    super.initState();
    nameController.addListener(_validateName);
    emailController.addListener(_validateEmail);
    passwordController.addListener(_validatePassword);
    confirmPasswordController.addListener(_validateConfirmPassword);
  }

  void _validateName() {
    final result = _formController.formValid({
      "value": nameController.text,
      "validators": [{"type": "empty"}]
    });
    setState(() {
      _nameErrorText = result["status"] == "ok" ? null : result["message"];
    });
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

  void _validatePassword() {
    final result = _formController.formValid({
      "value": passwordController.text,
      "validators": [{"type": "empty"}, {"type": "len", "len": 8}]
    });
    setState(() {
      _passwordErrorText = result["status"] == "ok" ? null : result["message"];
      if (passwordController.text.isNotEmpty &&
          confirmPasswordController.text.isNotEmpty &&
          passwordController.text != confirmPasswordController.text) {
        _confirmPasswordErrorText = "Şifreler uyuşmuyor!";
      } else if (confirmPasswordController.text.isNotEmpty &&
          passwordController.text == confirmPasswordController.text) {
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
      if (passwordController.text.isNotEmpty &&
          confirmPasswordController.text.isNotEmpty &&
          passwordController.text != confirmPasswordController.text) {
        _confirmPasswordErrorText = "Şifreler uyuşmuyor!";
      } else if (confirmPasswordController.text.isNotEmpty &&
          passwordController.text == confirmPasswordController.text) {
        _confirmPasswordErrorText = null;
      }
    });
  }

  @override
  void dispose() {
    nameController.removeListener(_validateName);
    emailController.removeListener(_validateEmail);
    passwordController.removeListener(_validatePassword);
    confirmPasswordController.removeListener(_validateConfirmPassword);

    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
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

  bool _isFormValid() {
    _validateName();
    _validateEmail();
    _validatePassword();
    _validateConfirmPassword();

    return _nameErrorText == null &&
        _emailErrorText == null &&
        _passwordErrorText == null &&
        _confirmPasswordErrorText == null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Yeni Hesap Oluştur'),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            state.whenOrNull(
              emailVerificationRequired: (name, email, password, passwordConfirmation, message) {
                _showSnackBar(message, isError: false);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VerifyRegistrationEmailPage(
                      email: email,
                      name: name,
                      password: password,
                      passwordConfirmation: passwordConfirmation,
                    ),
                  ),
                );
              },
              error: (message) {
                _showSnackBar(message, isError: true);
              },
            );
          },
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: const Icon(Icons.person_add, size: 120, color: Colors.blue),
                    ),
                    CustomTextField(
                      icon: Icons.person,
                      label: "İsim",
                      hint: "Adınız Soyadınız",
                      controller: nameController,
                      errorText: _nameErrorText,
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      icon: Icons.mail,
                      label: "E-posta",
                      hint: "example@gmail.com",
                      controller: emailController,
                      errorText: _emailErrorText,
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      icon: Icons.lock,
                      label: "Şifre",
                      hint: "En az 8 karakter",
                      isPassword: true,
                      controller: passwordController,
                      errorText: _passwordErrorText,
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      icon: Icons.lock,
                      label: "Şifreyi Tekrar",
                      hint: "Şifreyi tekrar girin",
                      isPassword: true,
                      controller: confirmPasswordController,
                      errorText: _confirmPasswordErrorText,
                    ),
                    const SizedBox(height: 30),
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        final bool isLoading = state.maybeWhen(
                          loading: () => true,
                          orElse: () => false,
                        );
                        return SizedBox(
                          height: 48,
                          width: double.infinity,
                          child: CustomButton(
                            text: isLoading ? "Kayıt Olunuyor..." : "Kayıt Ol",
                            onPressed: isLoading ? null : () async {
                              if (_isFormValid()) {
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
                                  print("Cihaz adı alınırken hata oluştu (Register): $e");
                                }

                                context.read<AuthBloc>().add(
                                  AuthEvent.registerRequested(
                                    name: nameController.text.trim(),
                                    email: emailController.text.trim(),
                                    password: passwordController.text,
                                    passwordConfirmation: confirmPasswordController.text,
                                    deviceName: deviceName,
                                  ),
                                );
                              } else {
                                _showSnackBar("Lütfen tüm alanları doğru şekilde doldurun.", isError: true);
                              }
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}