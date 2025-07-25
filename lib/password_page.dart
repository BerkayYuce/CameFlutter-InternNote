import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:login_page_flutter/new_password_page.dart';
import 'package:login_page_flutter/services/httpStatusCodes.dart';
import 'package:login_page_flutter/widgets/custom_button.dart';
import 'package:login_page_flutter/widgets/custom_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async'; // Timer için

class PasswordPage extends StatefulWidget {
  PasswordPage({super.key});

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {

  final TextEditingController emailController = TextEditingController();

  bool isLoading = false; // Gönder butonu için yükleme durumu
  bool isEmailValid = true;


  DateTime? _lastCodeSentTime;
  int _remainingSeconds = 0;
  Timer? _countdownTimer;
  static const int _cooldownDuration = 300; // 5 dakika = 300 saniye
  String? _cooldownEmail; // Cooldown süresince kilitli kalacak e-posta

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.14.143:8000/api',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  @override
  void initState() {
    super.initState();
    _loadLastCodeSentTime();
  }

  @override
  void dispose() {
    emailController.dispose();
    _countdownTimer?.cancel(); // Timer'ı iptal et
    super.dispose();
  }

  void showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  bool _isEmailValid(String email) {
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return regex.hasMatch(email);
  }

  // Son kod gönderme zamanını ve epostayı SharedPreferencestanyükle
  Future<void> _loadLastCodeSentTime() async {
    final prefs = await SharedPreferences.getInstance();
    final String? timestamp = prefs.getString('lastPasswordResetCodeSent');
    final String? email = prefs.getString('lastPasswordResetCodeEmail'); // E-postayı da yükle

    if (timestamp != null && email != null) {
      _lastCodeSentTime = DateTime.parse(timestamp);
      _cooldownEmail = email; // Yüklenen e-postayı kaydet
      emailController.text = email; // E-posta alanını önceden doldur
      _startCountdownTimer();
    }
  }

  // Geri sayım sayacını başlat
  void _startCountdownTimer() {
    if (_lastCodeSentTime == null) return;

    final now = DateTime.now();
    final elapsedSeconds = now.difference(_lastCodeSentTime!).inSeconds;
    _remainingSeconds = _cooldownDuration - elapsedSeconds;

    if (_remainingSeconds <= 0) {
      setState(() {
        _remainingSeconds = 0;
        _lastCodeSentTime = null; // süre doldu zaman damgasını temizle
        _cooldownEmail = null; // kilitli epostayı temizle
        emailController.clear(); // eposta alanını temizle
      });
      _countdownTimer?.cancel();
      return;
    }

    _countdownTimer?.cancel(); // mevcut timerı iptalet
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _countdownTimer?.cancel();
          _lastCodeSentTime = null; // süre doldu zaman damgasını temizle
          _cooldownEmail = null; // kilitli epostayı temizle
          emailController.clear(); // eposta alanını temizle
        }
      });
    });
  }

  Future<void> sendVerificationCode(String email) async {
    setState(() {
      isLoading = true; //yüklemeyi başlat
    });

    final data = {'email': email};

    try {
      final response = await _dio.post('/send-password-reset-code', data: data);

      if (!mounted) return;

      if (response.statusCode == 200) {

        // Başarılı olursa zaman damgasını ve e-postayı kaydet, geri sayımı başlat
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('lastPasswordResetCodeSent', DateTime.now().toIso8601String());
        await prefs.setString('lastPasswordResetCodeEmail', email); // E-postayı kaydet

        _lastCodeSentTime = DateTime.now();
        _cooldownEmail = email; // State'i güncelle
        _startCountdownTimer();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Şifre sıfırlama kodu e-posta adresinize gönderildi.')),
        );

        // Yeni kod gönderildikten sonra NewPasswordPage'e geç
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewPasswordPage(email: email),
          ),
        );
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

        showError('Bağlantı sağlanamıyor. Lütfen internet bağlantınızı kontrol edin');
      }
    } catch (e) {
      if (!mounted) return;
      showError('Beklenmedik bir hata oluştu, lütfen tekrar deneyin.');
    } finally {
      setState(() {
        isLoading = false; // Yüklemeyi durdur
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final minutes = _remainingSeconds ~/ 60;
    final seconds = _remainingSeconds % 60;
    final countdownText = _remainingSeconds > 0 ? '$minutes:${seconds.toString().padLeft(2, '0')}' : '';
    // Buton her zaman tıklanabilir olacak isLoading durumu sadece metni etkileyecek
    final bool canProceed = !isLoading && isEmailValid && emailController.text.isNotEmpty;
    // E-posta alanı cooldown süresince ve _cooldownEmail doluysa salt okunur olacak
    final bool isEmailReadOnly = _remainingSeconds > 0 && _cooldownEmail != null;


    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Came Özak'),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // İkon
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
                  child: const Icon(Icons.person, size: 150, color: Colors.blue),
                ),

                // Email TextField
                Container(
                  margin: const EdgeInsets.only(top: 80, left: 10, right: 10),
                  child: CustomTextField(
                    icon: Icons.mail,
                    label: "Email",
                    autofocus: false,
                    isPassword: false,
                    isValid: isEmailValid,
                    errorText: isEmailValid ? null : "Geçersiz veya boş e-posta!",
                    hint: "example@gmail.com",
                    controller: emailController,
                    readOnly: isEmailReadOnly,
                    callback: (value) {
                      setState(() {
                        isEmailValid = _isEmailValid(value);
                      });
                    },
                  ),
                ),

                // Cooldown metni
                if (_remainingSeconds > 0)
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Yeni kod göndermek için kalan süre: $countdownText',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ),

                // Buton
                Container(
                  height: 42,
                  width: 120,
                  margin: const EdgeInsets.symmetric(vertical: 60),
                  child: CustomButton(
                    text: isLoading
                        ? "Gönderiliyor..."
                        : (_remainingSeconds > 0 ? "İleri Git" : "Gönder"),
                    snackText: null,
                    snack: false,
                    isNavigation: true,
                    onPress: canProceed,
                    callback: (value) async {
                      if (value == "ok" && canProceed) {
                        final email = emailController.text.trim();
                        if (email.isEmpty || !isEmailValid) {
                          showError("Lütfen geçerli bir e-posta adresi girin.");
                          return;
                        }

                        if (_remainingSeconds > 0) {
                          // Cooldown aktifse, sadece NewPasswordPage'e geç
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   const SnackBar(content: Text('Zaten bir kod gönderildi, lütfen e-postanızı kontrol edin.')),
                          // );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewPasswordPage(email: email),
                            ),
                          );
                        } else {
                          // Cooldown aktif değilse, yeni kod gönder ve NewPasswordPage'e geç
                          await sendVerificationCode(email);
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


