// lib/pages/login_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page_flutter/bloc/auth/auth_bloc.dart';
import 'package:login_page_flutter/bloc/auth/auth_event.dart';
import 'package:login_page_flutter/bloc/auth/auth_state.dart';
import 'package:login_page_flutter/controllers/form_controller.dart';
import 'package:login_page_flutter/widgets/custom_button.dart';
import 'package:login_page_flutter/widgets/custom_text_field.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

import 'package:login_page_flutter/pages/register_page.dart';
import 'package:login_page_flutter/pages/password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FormController _formController = FormController();

  bool _rememberMe = false;
  bool _isButtonLoading = false;

  String? _usernameErrorText;
  String? _passwordErrorText;

  @override
  void initState() {
    super.initState();
    //Anlık girişleri kontrol yerine butona basınca kontrol için kaldırıldı.
    //_usernameController.addListener(_validateUsername);
    //_passwordController.addListener(_validatePassword);
  }

  void _validateUsername() {
    final result = _formController.formValid({
      "value": _usernameController.text,
      "validators": [{"type": "empty"}, {"type": "email"}]
    });
    setState(() {
      _usernameErrorText = result["status"] == "ok" ? null : result["message"];
    });
  }

  void _validatePassword() {
    final result = _formController.formValid({
      "value": _passwordController.text,
      "validators": [{"type": "empty"}, {"type": "len", "len": 8}]
    });
    setState(() {
      _passwordErrorText = result["status"] == "ok" ? null : result["message"];
    });
  }

  @override
  void dispose() {
    //Anlık girişleri kontrol yerine butona basınca kontrol için kaldırıldı.
    // _usernameController.removeListener(_validateUsername);
    // _passwordController.removeListener(_validatePassword);
    _usernameController.dispose();
    _passwordController.dispose();
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
        title: const Text('Came Özak'),
        backgroundColor: Colors.blue,
      ),

      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(

            loading: () {
              setState(() {
                _isButtonLoading = true;
              });
            },

            // success: (message, authToken, rememberMeToken, user) {
            //   setState(() {
            //     _isButtonLoading = false;
            //   });
            //   // Başarılı giriş mesajı gösterilebilir, ancak main.dart'taki listener yönlendirdiği için
            //   // bu mesaj HomePage'e geçmeden hemen önce kısa süreli görünebilir.
            //   // _showSnackBar(message, isError: false);
            // },

            error: (message) {
              setState(() {
                _isButtonLoading = false;
              });
              _showSnackBar(message, isError: true);
            },
            // EmailVerificationRequired durumu main.dart'taki listener tarafından yönlendirileceği için
            // burada özel bir işlem yapmaya gerek yok, ancak isterseniz mesaj gösterebilirsiniz.
            // emailVerificationRequired: (name, email, password, passwordConfirmation, message) {
            //   setState(() {
            //     _isButtonLoading = false;
            //   });
            //   _showSnackBar(message, isError: false);
            // }
          );
        },
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(9),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 5, blurRadius: 15, offset: const Offset(0, 3)),
                    ],
                  ),
                  child: const Icon(Icons.person, size: 150, color: Colors.blue),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15, top: 15),
                  child: CustomTextField(
                    icon: Icons.person,
                    label: "E-posta Adresi",
                    autofocus: true,
                    isPassword: false,
                    hint: "example@gmail.com",
                    controller: _usernameController,
                    errorText: _usernameErrorText,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: CustomTextField(
                    icon: Icons.lock,
                    label: "Şifre",
                    autofocus: false,
                    isPassword: true,
                    hint: "********",
                    controller: _passwordController,
                    errorText: _passwordErrorText,
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _rememberMe,
                      onChanged: (bool? value) {
                        setState(() {
                          _rememberMe = value ?? false;
                        });
                      },
                      fillColor: WidgetStateProperty.resolveWith((states) {
                        const Set<WidgetState> interactiveStates = <WidgetState>{
                          WidgetState.pressed,
                          WidgetState.hovered,
                          WidgetState.focused,
                        };
                        if (states.any(interactiveStates.contains)) {
                          return Colors.blue;
                        }
                        return Colors.blue;
                      }),
                    ),
                    const Text('Beni Hatırla'),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        if (mounted) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const PasswordPage()));
                        }
                      },
                      child: const Text('Şifremi unuttum', style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue)),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: _isButtonLoading ? "Giriş yapılıyor..." : "Giriş yap",
                        onPressed: _isButtonLoading ? null : () async {
                          _validateUsername();
                          _validatePassword();

                          if (_usernameErrorText == null && _passwordErrorText == null) {
                            String currentDeviceName = 'unknown_device';
                            try {
                              DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
                              if (defaultTargetPlatform == TargetPlatform.android) {
                                AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
                                currentDeviceName = androidInfo.model;
                              } else if (defaultTargetPlatform == TargetPlatform.iOS) {
                                IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
                                currentDeviceName = iosInfo.name;
                              } else {
                                currentDeviceName = 'flutter_app_desktop'; // Diğer platformlar için
                              }
                            } catch (e) {
                              print("Cihaz adı alınırken hata oluştu (Login): $e");
                            }

                            context.read<AuthBloc>().add(
                              AuthEvent.loginRequested(
                                email: _usernameController.text,
                                password: _passwordController.text,
                                deviceName: currentDeviceName,
                                rememberMe: _rememberMe,
                              ),
                            );
                          } else {
                            _showSnackBar("Lütfen giriş bilgilerinizi doğru girin.", isError: true);
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: CustomButton(
                        text: 'Kayıt ol',
                        onPressed: () {
                          if (mounted) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage()));
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}