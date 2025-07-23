// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:login_page_flutter/new_password_page.dart';
// import 'package:login_page_flutter/register_page.dart';
// import 'package:login_page_flutter/services/httpStatusCodes.dart';
// import 'package:login_page_flutter/widgets/custom_button.dart';
// import 'package:login_page_flutter/widgets/custom_text_field.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:async'; // Timer için
//
// class PasswordPage extends StatefulWidget {
//   PasswordPage({super.key});
//
//   @override
//   State<PasswordPage> createState() => _PasswordPageState();
// }
//
// class _PasswordPageState extends State<PasswordPage> {
//
//   final TextEditingController emailController = TextEditingController();
//
//   bool isLoading = false; // Gönder butonu için yükleme durumu
//   bool isEmailValid = true;
//
//
//   DateTime? _lastCodeSentTime;
//   int _remainingSeconds = 0;
//   Timer? _countdownTimer;
//   static const int _cooldownDuration = 300; // 5 dakika = 300 saniye
//   String? _cooldownEmail; // Cooldown süresince kilitli kalacak e-posta
//
//   final Dio _dio = Dio(
//     BaseOptions(
//       baseUrl: 'http://192.168.14.143:8000/api',
//       connectTimeout: const Duration(seconds: 5),
//       receiveTimeout: const Duration(seconds: 3),
//     ),
//   );
//
//   @override
//   void initState() {
//     super.initState();
//     _loadLastCodeSentTime();
//   }
//
//   @override
//   void dispose() {
//     emailController.dispose();
//     _countdownTimer?.cancel(); // Timer'ı iptal et
//     super.dispose();
//   }
//
//   void showError(String message) {
//     if (!mounted) return;
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
//   }
//
//   bool _isEmailValid(String email) {
//     final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
//     return regex.hasMatch(email);
//   }
//
//   // Son kod gönderme zamanını ve epostayı SharedPreferencestanyükle
//   Future<void> _loadLastCodeSentTime() async {
//     final prefs = await SharedPreferences.getInstance();
//     final String? timestamp = prefs.getString('lastPasswordResetCodeSent');
//     final String? email = prefs.getString('lastPasswordResetCodeEmail'); // E-postayı da yükle
//
//     if (timestamp != null && email != null) {
//       _lastCodeSentTime = DateTime.parse(timestamp);
//       _cooldownEmail = email; // Yüklenen e-postayı kaydet
//       emailController.text = email; // E-posta alanını önceden doldur
//       _startCountdownTimer();
//     }
//   }
//
//   // Geri sayım sayacını başlat
//   void _startCountdownTimer() {
//     if (_lastCodeSentTime == null) return;
//
//     final now = DateTime.now();
//     final elapsedSeconds = now.difference(_lastCodeSentTime!).inSeconds;
//     _remainingSeconds = _cooldownDuration - elapsedSeconds;
//
//     if (_remainingSeconds <= 0) {
//       setState(() {
//         _remainingSeconds = 0;
//         _lastCodeSentTime = null; // süre doldu zaman damgasını temizle
//         _cooldownEmail = null; // kilitli epostayı temizle
//         emailController.clear(); // eposta alanını temizle
//       });
//       _countdownTimer?.cancel();
//       return;
//     }
//
//     _countdownTimer?.cancel(); // mevcut timerı iptalet
//     _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         if (_remainingSeconds > 0) {
//           _remainingSeconds--;
//         } else {
//           _countdownTimer?.cancel();
//           _lastCodeSentTime = null; // süre doldu zaman damgasını temizle
//           _cooldownEmail = null; // kilitli epostayı temizle
//           emailController.clear(); // eposta alanını temizle
//         }
//       });
//     });
//   }
//
//   Future<void> sendVerificationCode(String email) async {
//     setState(() {
//       isLoading = true; //yüklemeyi başlat
//     });
//
//     final data = {'email': email};
//
//     try {
//       final response = await _dio.post('/send-password-reset-code', data: data);
//
//       if (!mounted) return;
//
//       if (response.statusCode == 200) {
//
//         // Başarılı olursa zaman damgasını ve e-postayı kaydet, geri sayımı başlat
//         final prefs = await SharedPreferences.getInstance();
//         await prefs.setString('lastPasswordResetCodeSent', DateTime.now().toIso8601String());
//         await prefs.setString('lastPasswordResetCodeEmail', email); // E-postayı kaydet
//
//         _lastCodeSentTime = DateTime.now();
//         _cooldownEmail = email; // State'i güncelle
//         _startCountdownTimer();
//
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Şifre sıfırlama kodu e-posta adresinize gönderildi.')),
//         );
//
//         // Yeni kod gönderildikten sonra NewPasswordPage'e geç
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => RegisterPage(email: email),
//           ),
//         );
//       } else {
//         // String errorMessage = "Kod gönderilirken bir hata oluştu.";
//         // if (response.data != null && response.data is Map) {
//         //   if (response.data.containsKey('message')) {
//         //     errorMessage = response.data['message'];
//         //   } else if (response.data.containsKey('errors')) {
//         //     Map<String, dynamic> errors = response.data['errors'];
//         //     errorMessage = errors.values.first is List ? errors.values.first.first : 'Doğrulama hatası.';
//         //   }
//         // }
//         //showError(errorMessage);
//
//         int? error = response.statusCode;
//         showError(HttpStatusCodes.getMessage(error!));
//       }
//     } on DioException catch (e) {
//       if (!mounted) return;
//
//       if (e.response != null) {
//         String errorMessage = "Sunucu hatası: ${e.response?.statusCode ?? 'Bilinmeyen'}";
//         if (e.response?.data != null && e.response!.data is Map) {
//           if (e.response!.data.containsKey('message')) {
//             errorMessage = e.response!.data['message'];
//           } else if (e.response!.data.containsKey('errors')) {
//             Map<String, dynamic> errors = e.response!.data['errors'];
//             errorMessage = errors.values.first is List ? errors.values.first.first : 'Doğrulama hatası.';
//           }
//         }
//         showError(errorMessage);
//       } else {
//         showError('Bir hata oluştu, lütfen internet bağlantınızı kontrol edin: ${e.toString()}');
//       }
//       print("Dio Hatası: $e");
//     } catch (e) {
//       if (!mounted) return;
//       showError('Beklenmedik bir hata oluştu, lütfen tekrar deneyin. ${e.toString()}');
//       print("Genel Hata: $e");
//     } finally {
//       setState(() {
//         isLoading = false; // Yüklemeyi durdur
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final minutes = _remainingSeconds ~/ 60;
//     final seconds = _remainingSeconds % 60;
//     final countdownText = _remainingSeconds > 0 ? '$minutes:${seconds.toString().padLeft(2, '0')}' : '';
//     // Buton her zaman tıklanabilir olacak isLoading durumu sadece metni etkileyecek
//     final bool canProceed = !isLoading && isEmailValid && emailController.text.isNotEmpty;
//     // E-posta alanı cooldown süresince ve _cooldownEmail doluysa salt okunur olacak
//     final bool isEmailReadOnly = _remainingSeconds > 0 && _cooldownEmail != null;
//
//
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         title: const Text('Came Özak'),
//         backgroundColor: Colors.blue,
//       ),
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView( // Ekran görüntüsündeki taşmayı önlemek için SingleChildScrollView'ı kullanıyoruz
//             padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0), // Dikey dolguyu azalttım
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 // İkon
//                 Container(
//                   margin: const EdgeInsets.only(bottom: 20),
//                   decoration: BoxDecoration(
//                     color: Colors.white70,
//                     borderRadius: const BorderRadius.all(Radius.circular(20)),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         spreadRadius: 5,
//                         blurRadius: 15,
//                         offset: const Offset(0, 3),
//                       ),
//                     ],
//                   ),
//                   child: const Icon(Icons.person, size: 150, color: Colors.blue),
//                 ),
//
//                 // Email TextField
//                 Container(
//                   margin: const EdgeInsets.only(top: 80, left: 10, right: 10), // Yan dolguları ayarladım
//                   child: CustomTextField(
//                     icon: Icons.mail,
//                     label: "Email",
//                     autofocus: false,
//                     isPassword: false,
//                     isValid: isEmailValid,
//                     errorText: isEmailValid ? null : "Geçersiz veya boş e-posta!",
//                     hint: "example@gmail.com",
//                     controller: emailController,
//                     readOnly:
//                     , // E-posta alanını salt okunur yap
//                     callback: (value) {
//                       setState(() {
//                         isEmailValid = _isEmailValid(value);
//                       });
//                     },
//                   ),
//                 ),
//
//                 // Cooldown metni
//                 if (_remainingSeconds > 0)
//                   Padding(
//                     padding: const EdgeInsets.only(top: 10.0),
//                     child: Text(
//                       'Yeni kod göndermek için kalan süre: $countdownText',
//                       style: const TextStyle(fontSize: 14, color: Colors.grey),
//                     ),
//                   ),
//
//                 // Buton
//                 Container(
//                   height: 42,
//                   width: 120, // Buton genişliğini ayarladım
//                   margin: const EdgeInsets.symmetric(vertical: 60),
//                   child: CustomButton(
//                     text: isLoading
//                         ? "Gönderiliyor..."
//                         : (_remainingSeconds > 0 ? "İleri Git" : "Gönder"), // Metin değişimi
//                     snackText: null,
//                     snack: false,
//                     isNavigation: true,
//                     onPress: canProceed, // E-posta geçerli ve yüklenmiyorsa tıklanabilir
//                     callback: (value) async {
//                       if (value == "ok" && canProceed) {
//                         final email = emailController.text.trim();
//                         if (email.isEmpty || !isEmailValid) {
//                           showError("Lütfen geçerli bir e-posta adresi girin.");
//                           return;
//                         }
//
//                         if (_remainingSeconds > 0) {
//                           // Cooldown aktifse, sadece NewPasswordPage'e geç
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(content: Text('Zaten bir kod gönderildi, lütfen e-postanızı kontrol edin.')),
//                           );
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => NewPasswordPage(email: email),
//                             ),
//                           );
//                         } else {
//                           // Cooldown aktif değilse, yeni kod gönder ve NewPasswordPage'e geç
//                           await sendVerificationCode(email);
//                         }
//                       }
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:async'; // Timer için
import 'package:login_page_flutter/services/httpStatusCodes.dart';
import 'package:login_page_flutter/widgets/custom_button.dart';
import 'package:login_page_flutter/widgets/custom_text_field.dart';
import 'package:login_page_flutter/main.dart'; // LoginPage'e dönmek için
import 'package:shared_preferences/shared_preferences.dart';

class VerifiedRegisterPage extends StatefulWidget {
  const VerifiedRegisterPage({super.key});

  @override
  State<VerifiedRegisterPage> createState() => _VerifiedRegisterPageState();
}

class _VerifiedRegisterPageState extends State<VerifiedRegisterPage> {
  // Aşama 1 için kontroller (E-posta girişi)
  final TextEditingController emailController = TextEditingController();

  // Aşama 2 için kontroller (Kod, İsim, Şifre girişleri)
  final TextEditingController codeController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // Doğrulama bayrakları
  bool isEmailValid = true; // E-posta formatı için
  bool nullCode = false; // Kod boş mu?
  bool nullName = false; // İsim boş mu?
  bool nullPassword = false; // Şifre boş mu?
  bool nullPassword2 = false; // Şifre tekrar boş mu?

  // Yükleme ve durum bayrakları
  bool _isSendingCode = false; // Kod gönderiliyor durumu
  bool _isCompletingRegistration = false; // Kayıt tamamlanıyor durumu
  bool _codeSent = false; // Kodun başarıyla gönderildiğini ve UI'nin değişmesi gerektiğini belirten bayrak

  // Cooldown ve Timer değişkenleri
  DateTime? _lastCodeSentTime;
  int _remainingSeconds = 0;
  Timer? _countdownTimer;
  static const int _cooldownDuration = 300; // 5 dakika = 300 saniye

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.14.143:8000/api', // API base URL'niz
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ),
  );

  @override
  void initState() {
    super.initState();
    _loadLastCodeSentTimeAndEmail();
  }

  @override
  void dispose() {
    emailController.dispose();
    codeController.dispose();
    nameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    _countdownTimer?.cancel();
    super.dispose();
  }

  void showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  bool _isValidEmailFormat(String email) {
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return regex.hasMatch(email);
  }

  // Shared Preferences'tan son kod gönderim zamanı ve e-postayı yükle
  Future<void> _loadLastCodeSentTimeAndEmail() async {
    final prefs = await SharedPreferences.getInstance();
    final String? timestamp = prefs.getString('lastRegistrationCodeSent');
    final String? email = prefs.getString('lastRegistrationCodeEmail');

    if (timestamp != null && email != null) {
      _lastCodeSentTime = DateTime.parse(timestamp);
      emailController.text = email;

      final now = DateTime.now();
      final elapsedSeconds = now.difference(_lastCodeSentTime!).inSeconds;
      if (elapsedSeconds < _cooldownDuration) {
        setState(() {
          _codeSent = true; // UI'ı ikinci aşamaya geçir
          _remainingSeconds = _cooldownDuration - elapsedSeconds;
        });
        _startCountdownTimer();
      } else {
        // Süre dolmuşsa SharedPreferences'ı temizle
        await prefs.remove('lastRegistrationCodeSent');
        await prefs.remove('lastRegistrationCodeEmail');
      }
    }
  }

  void _startCountdownTimer() {
    if (_lastCodeSentTime == null) return;

    _countdownTimer?.cancel(); // Mevcut timer'ı iptal et
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _countdownTimer?.cancel();
          // Süre dolduğunda bayrakları ve SharedPreferences'ı temizle
          _lastCodeSentTime = null;
          SharedPreferences.getInstance().then((prefs) {
            prefs.remove('lastRegistrationCodeSent');
            prefs.remove('lastRegistrationCodeEmail');
          });
          // _codeSent'i false yapmıyoruz, kullanıcı hala kayıtı tamamlayabilir,
          // sadece kodu yeniden gönderme butonu aktif hale gelir.
        }
      });
    });
  }

  // Aşama 1: Kod Gönderme isteği
  Future<void> _sendRegistrationCode() async {
    final email = emailController.text.trim();

    if (email.isEmpty || !_isValidEmailFormat(email)) {
      setState(() {
        isEmailValid = false;
      });
      showError('Lütfen geçerli bir e-posta adresi girin.');
      return;
    }

    setState(() {
      _isSendingCode = true;
    });

    try {
      final response = await _dio.post(
        '/send-password-reset-code',
        data: {'email': email},
        options: Options(
          validateStatus: (status) {
            return status != null && status < 500;
          },
        ),
      );

      if (!mounted) return;

      if (response.statusCode == 200) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('lastRegistrationCodeSent', DateTime.now().toIso8601String());
        await prefs.setString('lastRegistrationCodeEmail', email);

        _lastCodeSentTime = DateTime.now(); // Cooldown başlatmak için zamanı ayarla
        _startCountdownTimer();

        setState(() {
          _codeSent = true; // UI'ı ikinci aşamaya geçir
        });
        showError("Doğrulama kodu e-posta adresinize gönderildi.");
      } else {
        int? error = response.statusCode;
        showError(HttpStatusCodes.getMessage(error!));
      }
    } on DioException catch (e) {
      if (!mounted) return;
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
      if (!mounted) return;
      showError('Beklenmedik bir hata oluştu, lütfen tekrar deneyin: ${e.toString()}');
      print("Genel Hata: $e");
    } finally {
      setState(() {
        _isSendingCode = false;
      });
    }
  }

  // Aşama 2: Kaydı Tamamlama isteği
  Future<void> _completeRegistration() async {
    final email = emailController.text.trim(); // E-posta alanı değişmeyecek
    final code = codeController.text.trim();
    final name = nameController.text.trim();
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    // Alan doğrulama
    if (code.isEmpty || name.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      setState(() {
        nullCode = code.isEmpty;
        nullName = name.isEmpty;
        nullPassword = password.isEmpty;
        nullPassword2 = confirmPassword.isEmpty;
      });
      showError('Lütfen tüm alanları doldurun.');
      return;
    }
    if (password != confirmPassword) {
      showError('Şifreler uyuşmuyor.');
      return;
    }
    if (password.length < 8) {
      showError('Şifre en az 8 karakter olmalı.');
      return;
    }

    setState(() {
      _isCompletingRegistration = true;
    });

    final data = {
      'email': email,
      'code': code,
      'name': name,
      'password': password,
      'password_confirmation': confirmPassword,
      'device_name': 'flutter_app', // Sanctum için
    };

    try {
      final response = await _dio.post(
        '/register-with-code', // Laravel endpoint'i
        data: data,
        options: Options(
          validateStatus: (status) {
            return status != null && status < 500;
          },
        ),
      );

      if (!mounted) return;

      if (response.statusCode == 201) { // 201 Created bekleniyor
        // Başarılı kayıtta SharedPreferences'ı ve Timer'ı temizle
        final prefs = await SharedPreferences.getInstance();
        await prefs.remove('lastRegistrationCodeSent');
        await prefs.remove('lastRegistrationCodeEmail');
        _countdownTimer?.cancel();

        showError("Kaydınız başarıyla tamamlandı! Giriş yapabilirsiniz.");
        Navigator.popUntil(context, (route) => route.isFirst); // Tüm rotaları kapat
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage())); // Giriş sayfasına yönlendir
      } else {
        int? error = response.statusCode;
        showError(HttpStatusCodes.getMessage(error!));
      }
    } on DioException catch (e) {
      if (!mounted) return;
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
      if (!mounted) return;
      showError('Beklenmedik bir hata oluştu, lütfen tekrar deneyin: ${e.toString()}');
      print("Genel Hata: $e");
    } finally {
      setState(() {
        _isCompletingRegistration = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final minutes = _remainingSeconds ~/ 60;
    final seconds = _remainingSeconds % 60;
    final countdownText = _remainingSeconds > 0 ? '$minutes:${seconds.toString().padLeft(2, '0')}' : '';
    final bool canResendCode = _remainingSeconds == 0 && !_isSendingCode; // Tekrar gönderilebilir mi?
    //final bool canProceedToRegister = _codeSent && !_isCompletingRegistration; // Kayıt tamamlanabilir mi? (Button'ın onPress'inde kontrol ediliyor)

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Yeni Hesap Oluştur'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.person_add, size: 100, color: Colors.blue),
              const SizedBox(height: 30),

              // E-posta giriş alanı (Kod gönderilene kadar veya cooldown bitene kadar düzenlenebilir)
              CustomTextField(
                icon: Icons.mail,
                label: "E-posta",
                hint: "example@gmail.com",
                controller: emailController,
                autofocus: true,
                isPassword: false,
                isValid: isEmailValid,
                errorText: isEmailValid ? null : "Geçersiz veya boş e-posta!",
                // Kod gönderildiyse veya cooldown varsa e-postayı salt okunur yap
                readOnly: _codeSent || (_remainingSeconds > 0 && _lastCodeSentTime != null),
                callback: (value) {
                  setState(() {
                    isEmailValid = _isValidEmailFormat(value);
                  });
                },
              ),
              const SizedBox(height: 20),

              // UI'nin aşamasına göre farklı buton ve alanlar
              if (!_codeSent || (_remainingSeconds == 0 && _lastCodeSentTime == null && !emailController.text.isEmpty && isEmailValid))
              // İlk aşama: E-posta girildi ve henüz kod gönderilmediyse veya cooldown bittiyse
                Column(
                  children: [
                    if (_remainingSeconds > 0)
                      Text(
                        'Yeni kod göndermek için kalan süre: $countdownText',
                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 42,
                      width: 180,
                      child: CustomButton(
                        text: _isSendingCode ? "Gönderiliyor..." : "Kod Gönder",
                        snackText: null,
                        snack: false,
                        isNavigation: false,
                        onPress: !_isSendingCode && isEmailValid && emailController.text.isNotEmpty,
                        callback: (value) async {
                          if (value == "ok") {
                            await _sendRegistrationCode();
                          }
                        },
                      ),
                    ),
                  ],
                )
              else // Kod gönderildi ve ikinci aşama (veya cooldown devam ediyor)
                Column(
                  children: [
                    Text(
                      '${emailController.text} adresinize gönderilen doğrulama kodunu ve diğer bilgileri girin.',
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
                      isValid: !nullCode,
                      errorText: nullCode ? "Doğrulama kodu boş bırakılamaz!" : null,
                      callback: (value) {
                        setState(() {
                          nullCode = value.isEmpty;
                        });
                      },
                    ),
                    const SizedBox(height: 20),

                    // İsim TextField
                    CustomTextField(
                      icon: Icons.person,
                      label: "İsim Soyisim",
                      hint: "Adınız Soyadınız",
                      controller: nameController,
                      autofocus: false,
                      isPassword: false,
                      isValid: !nullName,
                      errorText: nullName ? "İsim alanı boş bırakılamaz!" : null,
                      callback: (value) {
                        setState(() {
                          nullName = value.isEmpty;
                        });
                      },
                    ),
                    const SizedBox(height: 20),

                    // Şifre TextField
                    CustomTextField(
                      icon: Icons.lock,
                      autofocus: false,
                      label: "Şifre",
                      hint: "Şifrenizi girin",
                      controller: passwordController,
                      errorText: nullPassword ? "Şifre alanı boş bırakılamaz!" : null,
                      isPassword: true,
                      isValid: !nullPassword,
                      callback: (value) {
                        setState(() {
                          nullPassword = value.isEmpty;
                        });
                      },
                    ),
                    const SizedBox(height: 20),

                    // Şifre Tekrar TextField
                    CustomTextField(
                      icon: Icons.lock,
                      autofocus: false,
                      label: "Şifre Tekrar",
                      hint: "Şifrenizi tekrar girin",
                      controller: confirmPasswordController,
                      isPassword: true,
                      errorText: nullPassword2 ? "Şifre alanı boş bırakılamaz" : null,
                      isValid: !nullPassword2,
                      callback: (value) {
                        setState(() {
                          nullPassword2 = value.isEmpty;
                        });
                      },
                    ),
                    const SizedBox(height: 40),

                    // Kaydı Tamamla Butonu (Aşama 2 için ana buton)
                    SizedBox(
                      height: 42,
                      width: 180,
                      child: CustomButton(
                        text: _isCompletingRegistration ? "Kaydediliyor..." : "Kaydı Tamamla",
                        snackText: null,
                        snack: false,
                        isNavigation: false,
                        onPress: !_isCompletingRegistration && !nullCode && !nullName && !nullPassword && !nullPassword2,
                        callback: (value) async {
                          if (value == "ok") {
                            await _completeRegistration();
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Kodu Yeniden Gönder Butonu (Aşama 2'de)
                    SizedBox(
                      height: 42,
                      width: 180,
                      child: CustomButton(
                        text: _isSendingCode // Bu değişken _isResendingCode gibi davranacak
                            ? "Gönderiliyor..."
                            : (canResendCode ? "Kodu Yeniden Gönder" : "Yeniden Gönder (${countdownText})"),
                        snackText: null,
                        snack: false,
                        isNavigation: false,
                        onPress: canResendCode,
                        callback: (value) async {
                          if (value == "ok") {
                            await _sendRegistrationCode(); // Tekrar kodu gönder
                          }
                        },
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 20),
              // Giriş Sayfasına Dön Butonu (Her zaman görünür)
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()), // Mevcut giriş sayfanıza yönlendirin
                  );
                },
                child: const Text('Zaten bir hesabınız var mı? Giriş yapın.'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
