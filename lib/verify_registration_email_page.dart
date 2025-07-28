// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:login_page_flutter/main.dart'; // LoginPage'e dönmek için
// import 'package:login_page_flutter/services/httpStatusCodes.dart';
// import 'package:login_page_flutter/widgets/custom_button.dart';
// import 'package:login_page_flutter/widgets/custom_text_field.dart';
// import 'dart:async'; // Timer için
//
// class VerifyRegistrationEmailPage extends StatefulWidget {
//   final String email;
//   final String name;
//   final String password;
//   final String passwordConfirmation;
//
//   const VerifyRegistrationEmailPage({
//     Key? key,
//     required this.email,
//     required this.name,
//     required this.password,
//     required this.passwordConfirmation,
//   }) : super(key: key);
//
//   @override
//   State<VerifyRegistrationEmailPage> createState() => _VerifyRegistrationEmailPageState();
// }
//
// class _VerifyRegistrationEmailPageState extends State<VerifyRegistrationEmailPage> {
//   final TextEditingController codeController = TextEditingController();
//   bool _isVerifying = false; // Doğrulama butonu için yükleme durumu
//   bool _isResendingCode = false; // Yeniden gönderme butonu için yükleme durumu
//
//   // Geri sayım için değişkenler
//   int _remainingSeconds = 0;
//   Timer? _countdownTimer;
//   static const int _cooldownDuration = 60; // 1 dakika = 60 saniye (AuthController'daki ile uyumlu olmalı!)
//
//   final Dio _dio = Dio(
//     BaseOptions(
//       baseUrl: 'http://192.168.14.143:8000/api', // API base URL'niz
//       connectTimeout: const Duration(seconds: 5),
//       receiveTimeout: const Duration(seconds: 3),
//     ),
//   );
//
//   @override
//   void initState() {
//     super.initState();
//     // Sayfa yüklendiğinde geri sayım başlatılır
//     _startCountdownTimer();
//   }
//
//   @override
//   void dispose() {
//     codeController.dispose();
//     _countdownTimer?.cancel();
//     super.dispose();
//   }
//
//   void showError(String message) {
//     if (!mounted) return;
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
//   }
//
//   void _startCountdownTimer() {
//     setState(() {
//       _remainingSeconds = _cooldownDuration;
//     });
//
//     _countdownTimer?.cancel();
//     _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         if (_remainingSeconds > 0) {
//           _remainingSeconds--;
//         } else {
//           _countdownTimer?.cancel();
//         }
//       });
//     });
//   }
//
//   Future<void> _resendVerificationCode() async {
//     setState(() {
//       _isResendingCode = true;
//       codeController.clear(); // Yeniden gönderimde eski kodu temizle
//     });
//
//     try {
//       final response = await _dio.post(
//         // 'register' endpoint'i artık doğrulama kodu gönderiyor
//         '/register',
//         data: {
//           'name': widget.name,
//           'email': widget.email,
//           'password': widget.password,
//           'password_confirmation': widget.passwordConfirmation,
//         },
//         options: Options(
//           validateStatus: (status) {
//             return status != null && status < 500;
//           },
//         ),
//       );
//
//       if (response.statusCode == 200) {
//         showError(response.data['message'] ?? "Yeni doğrulama kodu e-posta adresinize gönderildi.");
//         _startCountdownTimer(); // Geri sayımı yeniden başlat
//       } else {
//         String errorMessage = "Kod gönderilirken bir hata oluştu.";
//         if (response.data != null && response.data is Map && response.data.containsKey('message')) {
//           errorMessage = response.data['message'];
//         } else {
//           int? error = response.statusCode;
//           errorMessage = HttpStatusCodes.getMessage(error!);
//         }
//         showError(errorMessage);
//       }
//     } on DioException catch (e) {
//       if (!mounted) return;
//       String errorMessage = "Bir hata oluştu.";
//       if (e.response != null) {
//         if (e.response!.data != null && e.response!.data is Map && e.response!.data.containsKey('message')) {
//           errorMessage = e.response!.data['message'];
//         } else {
//           errorMessage = "Sunucu hatası: ${e.response?.statusCode ?? 'Bilinmeyen'}";
//         }
//       } else {
//         errorMessage = 'İnternet bağlantınızı kontrol edin.';
//       }
//       showError(errorMessage);
//     } catch (e) {
//       if (!mounted) return;
//       showError('Beklenmedik bir hata oluştu: ${e.toString()}');
//     } finally {
//       setState(() {
//         _isResendingCode = false;
//       });
//     }
//   }
//
//   Future<void> _verifyEmailAndRegister() async {
//     setState(() {
//       _isVerifying = true;
//     });
//
//     final code = codeController.text.trim();
//
//     if (code.isEmpty) {
//       showError('Lütfen doğrulama kodunu girin.');
//       setState(() {
//         _isVerifying = false;
//       });
//       return;
//     }
//
//     // `device_name` değeri, `AuthController`'da token oluşturmak için gerekli.
//     // Bu değeri Flutter uygulamanızdan geldiğini belirtmek için kullanıyoruz.
//     final deviceName = 'flutter_app';
//
//     try {
//       final response = await _dio.post(
//         '/verify-email', // E-posta doğrulama için yeni endpoint
//         data: {
//           'name': widget.name,
//           'email': widget.email,
//           'password': widget.password,
//           'password_confirmation': widget.passwordConfirmation,
//           'code': code,
//           'device_name': deviceName,
//         },
//         options: Options(
//           headers: {'Accept': 'application/json'},
//           validateStatus: (status) {
//             return status != null && status < 500;
//           },
//         ),
//       );
//
//       if (response.statusCode == 201) { // 201 Created durum kodu bekleniyor (başarılı kayıt)
//         showError(response.data['message'] ?? "E-posta başarıyla doğrulandı ve kaydınız tamamlandı.");
//         if (mounted) {
//           // Başarılı kayıttan sonra LoginPage'e dön
//           Navigator.popUntil(context, (route) => route.isFirst);
//           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
//         }
//       } else {
//         // API'den gelen spesifik hata mesajını göster
//         String errorMessage = "Doğrulama başarısız oldu.";
//         if (response.data != null && response.data is Map && response.data.containsKey('message')) {
//           errorMessage = response.data['message'];
//         } else {
//           int? error = response.statusCode;
//           errorMessage = HttpStatusCodes.getMessage(error!);
//         }
//         showError(errorMessage);
//       }
//     } on DioException catch (e) {
//       if (!mounted) return;
//       String errorMessage = "Bir hata oluştu.";
//       if (e.response != null) {
//         if (e.response!.data != null && e.response!.data is Map && e.response!.data.containsKey('message')) {
//           errorMessage = e.response!.data['message'];
//         } else if (e.response!.statusCode == 422) { // Doğrulama hatası (Laravel validation errors)
//           errorMessage = "Girilen bilgilerde hata var.";
//           if (e.response!.data != null && e.response!.data is Map && e.response!.data.containsKey('errors')) {
//             Map<String, dynamic> errors = e.response!.data['errors'];
//             if (errors.containsKey('email')) {
//               errorMessage = errors['email'][0]; // Örneğin: "The email has already been taken."
//             } else if (errors.containsKey('code')) {
//               errorMessage = errors['code'][0]; // Örneğin: "The code field is required."
//             }
//           }
//         } else {
//           errorMessage = "Sunucu hatası: ${e.response?.statusCode ?? 'Bilinmeyen'}";
//         }
//       } else {
//         // Ağ hatası (internet bağlantısı yok vb.)
//         errorMessage = 'İnternet bağlantınızı kontrol edin.';
//       }
//       showError(errorMessage);
//     } catch (e) {
//       if (!mounted) return;
//       showError('Beklenmedik bir hata oluştu: ${e.toString()}');
//     } finally {
//       setState(() {
//         _isVerifying = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final minutes = _remainingSeconds ~/ 60;
//     final seconds = _remainingSeconds % 60;
//     final countdownText = _remainingSeconds > 0 ? '$minutes:${seconds.toString().padLeft(2, '0')}' : '';
//     final bool canResendCode = _remainingSeconds == 0 && !_isResendingCode;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('E-posta Doğrulama'),
//         backgroundColor: Colors.blue,
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Icon(Icons.verified_user, size: 100, color: Colors.blue),
//               const SizedBox(height: 30),
//               Text(
//                 '${widget.email} adresinize bir doğrulama kodu gönderildi. Lütfen kodu girin.',
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(fontSize: 16),
//               ),
//               const SizedBox(height: 10),
//               if (_remainingSeconds > 0)
//                 Text(
//                   'Yeni kod göndermek için kalan süre: $countdownText',
//                   style: const TextStyle(fontSize: 14, color: Colors.grey),
//                 ),
//               const SizedBox(height: 30),
//
//               CustomTextField(
//                 icon: Icons.vpn_key,
//                 label: "Doğrulama Kodu",
//                 hint: "E-postanıza gelen kodu girin",
//                 controller: codeController,
//                 autofocus: true,
//                 isPassword: false,
//                 isValid: true, // Kullanıcının girdiği her şeyi şimdilik geçerli kabul edelim
//                 callback: (value) {
//                   // İhtiyaç olursa burada kod uzunluğu vb. doğrulama yapılabilir
//                 },
//               ),
//
//               const SizedBox(height: 40),
//
//               SizedBox(
//                 height: 42,
//                 width: 180,
//                 child: CustomButton(
//                   text: _isVerifying ? "Doğrulanıyor..." : "Hesabı Doğrula",
//                   snackText: "",
//                   snack: false,
//                   isNavigation: false, // Doğrudan navigasyon yapmayacak
//                   onPress: !_isVerifying, // Yüklenirken devre dışı bırak
//                   callback: (value) async {
//                     if (value == "ok" && !_isVerifying) {
//                       await _verifyEmailAndRegister();
//                     }
//                   },
//                 ),
//               ),
//               const SizedBox(height: 20),
//               SizedBox(
//                 height: 42,
//                 width: 180,
//                 child: CustomButton(
//                   text: _isResendingCode
//                       ? "Gönderiliyor..."
//                       : (canResendCode ? "Kodu Yeniden Gönder" : "Yeniden Gönder (${countdownText})"),
//                   snackText: "",
//                   snack: false,
//                   isNavigation: false,
//                   onPress: canResendCode, // Süre dolduğunda ve yüklenmiyorsa aktif
//                   callback: (value) async {
//                     if (value == "ok" && canResendCode) {
//                       await _resendVerificationCode();
//                     }
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//-----------------------------------------------------------------------------------------------

import 'package:dio/dio.dart'; // Dio instance'ı Bloc'tan gelecek
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Bloc kütüphanesi
import 'package:login_page_flutter/blocs/email_verification/email_verification_bloc.dart'; // EmailVerificationBloc import
import 'package:login_page_flutter/main.dart'; // LoginPage'e dönmek için
import 'package:login_page_flutter/services/httpStatusCodes.dart'; // Artık Bloc içinde kullanılacak
import 'package:login_page_flutter/widgets/custom_button.dart';
import 'package:login_page_flutter/widgets/custom_text_field.dart';
import 'dart:async'; // Timer Bloc içinde

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

  // Yükleme durumları Bloc'tan yönetilecek.
  // Geri sayım ve timer mantığı Bloc'a taşındı.

  @override
  void initState() {
    super.initState();
    // Bloc'u dinleyerek geri sayımı başlatabiliriz veya Bloc'un kendi initState'inde başlar.
    // Bu senaryoda EmailVerificationBloc'un kendisi initState'inde başlattığı için burada bir şey yapmaya gerek yok.
  }

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }

  void showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
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
          if (state is EmailVerificationSuccess) {
            showError(state.message);
            // Başarılı kayıttan sonra LoginPage'e dön
            Navigator.popUntil(context, (route) => route.isFirst);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
          } else if (state is EmailVerificationError) {
            showError(state.message);
          } else if (state is EmailVerificationCooldown) {
            // Cooldown mesajı UI'da gösteriliyor, ekstra snackbar'a gerek yok
          }
        },
        child: BlocBuilder<EmailVerificationBloc, EmailVerificationState>(
          builder: (context, state) {
            final int remainingSeconds = (state is EmailVerificationCooldown) ? state.remainingSeconds : 0;
            final bool isVerifying = state is EmailVerificationLoading;
            final bool canResendCode = remainingSeconds == 0 && !isVerifying; // Yüklenmiyor ve süre 0 ise

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
                      isValid: true,
                      callback: (value) {
                        // callback: (value) {} boş kalabilir veya basit bir ön doğrulama eklenebilir
                      },
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      height: 42,
                      width: 180,
                      child: CustomButton(
                        text: isVerifying ? "Doğrulanıyor..." : "Hesabı Doğrula",
                        snackText: "",
                        snack: false,
                        isNavigation: false,
                        onPress: !isVerifying,
                        callback: (value) async {
                          if (value == "ok" && !isVerifying) {
                            final deviceName = 'flutter_app'; // Veya DeviceInfoPlus ile alınabilir

                            context.read<EmailVerificationBloc>().add(
                              VerifyEmailRequested(
                                name: widget.name,
                                email: widget.email,
                                password: widget.password,
                                passwordConfirmation: widget.passwordConfirmation,
                                code: codeController.text.trim(),
                                deviceName: deviceName,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 42,
                      width: 180,
                      child: CustomButton(
                        text: state is EmailVerificationLoading
                            ? "Gönderiliyor..."
                            : (canResendCode ? "Kodu Yeniden Gönder" : "Yeniden Gönder (${countdownText})"),
                        snackText: "",
                        snack: false,
                        isNavigation: false,
                        onPress: canResendCode,
                        callback: (value) async {
                          if (value == "ok" && canResendCode) {
                            context.read<EmailVerificationBloc>().add(
                              ResendVerificationCodeRequested(
                                name: widget.name,
                                email: widget.email,
                                password: widget.password,
                                passwordConfirmation: widget.passwordConfirmation,
                              ),
                            );
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