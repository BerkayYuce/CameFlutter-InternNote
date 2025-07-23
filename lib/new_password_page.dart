import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:async'; // Timer için
import 'package:login_page_flutter/services/httpStatusCodes.dart';
import 'package:login_page_flutter/widgets/custom_button.dart';
import 'package:login_page_flutter/widgets/custom_text_field.dart';
import 'package:login_page_flutter/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  bool nullValidation = false;
  bool nullPass = false;
  bool nullPass2 = false;
  bool _isResettingPassword = false; // Şifre sıfırlama butonu için yükleme durumu
  bool _isResendingCode = false; // Kod yeniden gönderme butonu için yükleme durumu

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.14.143:8000/api',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ),
  );

  // Geri sayım için değişkenler
  int _remainingSeconds = 0;
  Timer? _countdownTimer;
  static const int _cooldownDuration = 300; // 5 dakika = 300 saniye

  @override
  void initState() {
    super.initState();
    // Sayfa yüklendiğinde geri sayım başlatılır
    _startCountdownTimer();
  }

  @override
  void dispose() {
    codeController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    _countdownTimer?.cancel(); // Timerı iptal et
    super.dispose();
  }

  void showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  void _startCountdownTimer() {
    // SharedPreferencestan son gönderim zamanını yükle
    SharedPreferences.getInstance().then((prefs) {
      final String? timestamp = prefs.getString('lastPasswordResetCodeSent');
      if (timestamp != null) {
        final lastSentTime = DateTime.parse(timestamp);
        final now = DateTime.now();
        final elapsedSeconds = now.difference(lastSentTime).inSeconds;

        setState(() {
          _remainingSeconds = _cooldownDuration - elapsedSeconds;
        });

        if (_remainingSeconds <= 0) {
          _remainingSeconds = 0; // Süre dolduysa 0 yap
          prefs.remove('lastPasswordResetCodeSent'); // Süre dolduğu için zamanı temizle
        }

        _countdownTimer?.cancel(); // Mevcut timerı iptal et
        _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
          setState(() {
            if (_remainingSeconds > 0) {
              _remainingSeconds--;
            } else {
              _countdownTimer?.cancel();
              prefs.remove('lastPasswordResetCodeSent'); // Süre doldu zamanı temizle
            }
          });
        });

      } else {
        // Eğer timestamp nullsa ilk kez kod gönderildiği varsayılır ve geri sayım başlatılır.
        // Bu durum password_pageden ilk kez gelindiğinde veya uygulama yeniden başlatıldığında oluşur.
        setState(() {
          _remainingSeconds = _cooldownDuration;
        });

        _countdownTimer?.cancel();

        _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
          setState(() {
            if (_remainingSeconds > 0) {
              _remainingSeconds--;
            } else {
              _countdownTimer?.cancel();
            }
          });
        });
      }
    });
  }


  Future<void> _sendResetCodeRequest() async {
    setState(() {
      _isResendingCode = true;
    });

    try {
      final response = await _dio.post(
        '/send-password-reset-code',
        data: {
          'email': widget.email
        },
        options: Options(
          validateStatus: (status) {
            return status != null && status < 500;
          },
        ),
      );

      if (response.statusCode == 200) {
        // Başarılı olursa zamanı kaydet ve geri sayımı yeniden başlat
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('lastPasswordResetCodeSent', DateTime.now().toIso8601String());
        showError("Yeni şifre sıfırlama kodu e-posta adresinize gönderildi.");
        _startCountdownTimer(); // Başarılı olursa geri sayımı yeniden başlat
      } else {
        // String errorMessage = "Kod gönderilirken bir hata oluştu.";
        // if (response.data != null && response.data is Map) {
        //   if (response.data.containsKey('message')) {
        //     errorMessage = response.data['message'];
        //   } else if (response.data.containsKey('errors')) {
        //     Map<String, dynamic> errors = response.data['errors'];
        //     errorMessage = errors.values.first is List ? errors.values.first.first : 'Doğrulama hatası.';
        //   }
        // }
        // showError(errorMessage);

        int? error = response.statusCode;
        showError(HttpStatusCodes.getMessage(error!));

      }
    } on DioException catch (e) {
      if (e.response != null) {
        String errorMessage = "Sunucu hatası: ${e.response?.statusCode ?? 'Bilinmeyen'}";
        if (e.response?.data != null && e.response!.data is Map) {
          if (e.response!.data.containsKey('message')) {
            errorMessage = e.response!.data['message'];
          } else if (e.response!.data.containsKey('errors')) {
            Map<String, dynamic> errors = e.response!.data['errors'];
            errorMessage = errors.values.first is List ? errors.values.first.first : 'Doğrulama hatası.';
          }
        }
        showError(errorMessage);
      } else {
        showError("İstek gönderilirken bir hata oluştu: Lütfen internet bağlantınızı kontrol edin.");
      }
      print("Dio Hatası: $e");
    } catch (e) {
      showError('Beklenmedik bir hata oluştu, lütfen tekrar deneyin: ${e.toString()}');
      print("Genel Hata: $e");
    } finally {
      setState(() {
        _isResendingCode = false;
      });
    }
  }

  Future<void> resetPassword() async {
    setState(() {
      _isResettingPassword = true;
    });

    final code = codeController.text.trim();
    final newPassword = newPasswordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (code.isEmpty || newPassword.isEmpty || confirmPassword.isEmpty) {
      showError('Lütfen tüm alanları doldurun.');
      setState(() {
        _isResettingPassword = false;
      });
      return;
    }

    if (newPassword != confirmPassword) {
      showError('Şifreler uyuşmuyor.');
      setState(() {
        _isResettingPassword = false;
      });
      return;
    }

    if (newPassword.length < 8) { // Laravel'deki min:8 kuralına uygun
      showError('Şifre en az 8 karakter olmalı.');
      setState(() {
        _isResettingPassword = false;
      });
      return;
    }

    final data = {
      'email': widget.email,
      'code': code,
      'password': newPassword,
      'password_confirmation': confirmPassword,
    };

    try {
      final response = await _dio.post('/reset-password-with-code', data: data);

      if (response.statusCode == 200) {
        // Şifre başarıyla sıfırlandığında cooldown zamanını temizle
        final prefs = await SharedPreferences.getInstance();
        await prefs.remove('lastPasswordResetCodeSent');

        showError("Şifreniz başarıyla sıfırlandı. Giriş yapabilirsiniz.");
        if (mounted) {
          Navigator.popUntil(context, (route) => route.isFirst); // Ana sayfaya veya LoginPageye dön
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
        }
      } else {
        // String errorMessage = "Şifre sıfırlanırken bir hata oluştu.";
        // if (response.data != null && response.data is Map) {
        //   if (response.data.containsKey('message')) {
        //     errorMessage = response.data['message'];
        //   } else if (response.data.containsKey('errors')) {
        //     Map<String, dynamic> errors = response.data['errors'];
        //     errorMessage = errors.values.first is List ? errors.values.first.first : 'Doğrulama hatası.';
        //   }
        // }
        // showError(errorMessage);

        int? error = response.statusCode;
        showError(HttpStatusCodes.getMessage(error!));

      }
    } on DioException catch (e) {
      if (e.response != null) {
        String errorMessage = "Sunucu hatası: ${e.response?.statusCode ?? 'Bilinmeyen'}";
        if (e.response?.data != null && e.response!.data is Map) {
          if (e.response!.data.containsKey('message')) {
            errorMessage = e.response!.data['message'];
          } else if (e.response!.data.containsKey('errors')) {
            Map<String, dynamic> errors = e.response!.data['errors'];
            errorMessage = errors.values.first is List ? errors.values.first.first : 'Doğrulama hatası.';
          }
        }
        showError(errorMessage);
      } else {
        showError('Bir hata oluştu, lütfen internet bağlantınızı kontrol edin: ${e.toString()}');
      }
      print("Dio Hatası: $e");
    } catch (e) {
      showError('Beklenmedik bir hata oluştu, lütfen tekrar deneyin: ${e.toString()}');
      print("Genel Hata: $e");
    } finally {
      setState(() {
        _isResettingPassword = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final minutes = _remainingSeconds ~/ 60;
    final seconds = _remainingSeconds % 60;
    final countdownText = _remainingSeconds > 0 ? '$minutes:${seconds.toString().padLeft(2, '0')}' : '';
    final bool canResendCode = _remainingSeconds == 0 && !_isResendingCode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Şifre Sıfırlama Onayı'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
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
              if (_remainingSeconds > 0)
                Text(
                  'Yeni kod göndermek için kalan süre: $countdownText',
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              const SizedBox(height: 30),

              // Doğrulama Kodu TextField
              CustomTextField(
                icon: Icons.vpn_key,
                label: "Doğrulama Kodu",
                hint: "E-postanıza gelen kodu girin",
                controller: codeController,
                autofocus: true,
                isPassword: false,
                isValid: !nullValidation,
                callback: (value) {
                  setState(() {
                    nullValidation = value.isEmpty;
                  });
                },
              ),

              const SizedBox(height: 20),

              // Yeni Şifre TextField
              CustomTextField(
                icon: Icons.lock,
                autofocus: false,
                label: "Yeni Şifre",
                hint: "Yeni şifrenizi girin",
                controller: newPasswordController,
                errorText: nullPass ? "Şifre alanı boş bırakılamaz!" : null,
                isPassword: true,
                isValid: !nullPass,
                callback: (value) {
                  setState(() {
                    nullPass = value.isEmpty;
                  });
                },
              ),

              const SizedBox(height: 20),

              // Yeni Şifre Tekrar TextField
              CustomTextField(
                icon: Icons.lock,
                autofocus: false,
                label: "Yeni Şifre Tekrar",
                hint: "Yeni şifrenizi tekrar girin",
                controller: confirmPasswordController,
                isPassword: true,
                errorText: nullPass2 ? "Şifre alanı boş bırakılamaz!" : null,
                isValid: !nullPass2, // nullValidation yerine nullPass2
                callback: (value) {
                  setState(() {
                    nullPass2 = value.isEmpty;
                  });
                },
              ),

              const SizedBox(height: 40),

              // Şifreyi Sıfırla Butonu
              SizedBox(
                height: 42,
                width: 180, // Buton genişliğini artırdım
                child: CustomButton(
                  text: _isResettingPassword ? "Sıfırlanıyor..." : "Şifreyi Sıfırla",
                  snackText: "",
                  snack: false,
                  isNavigation: false,
                  onPress: !_isResettingPassword, // Yüklenirken devre dışı bırak
                  callback: (value) async {
                    if (value == "ok" && !_isResettingPassword) {
                      await resetPassword();
                    }
                  },
                ),
              ),
              const SizedBox(height: 20),
              // Yeniden Gönder Butonu
              SizedBox(
                height: 42,
                width: 180, // Buton genişliğini artırdım
                child: CustomButton(
                  text: _isResendingCode
                      ? "Gönderiliyor..."
                      : (canResendCode ? "Kodu Yeniden Gönder" : "Yeniden Gönder (${countdownText})"),
                  snackText: "",
                  snack: false,
                  isNavigation: false,
                  onPress: canResendCode, // Süre dolduğunda ve yüklenmiyorsa aktif
                  callback: (value) async {
                    if (value == "ok" && canResendCode) {
                      await _sendResetCodeRequest();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

