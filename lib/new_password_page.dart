import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:login_page_flutter/services/HttpStatusCodes.dart';
import 'package:login_page_flutter/widgets/custom_button.dart';
import 'package:login_page_flutter/widgets/custom_text_field.dart';


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

  @override
  void dispose() {
    codeController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> resetPassword() async {
    final code = codeController.text.trim();
    final newPassword = newPasswordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (code.isEmpty || newPassword.isEmpty || confirmPassword.isEmpty) {
      showError('Lütfen tüm alanları doldurun.');
      return;
    }

    if (newPassword != confirmPassword) {
      showError('Şifreler uyuşmuyor.');
      return;
    }

    final dio = Dio();
    final url = 'http://192.168.14.143:8000/api/reset-password-with-code';
    final data = {
      'email': widget.email, // PasswordPage'den gelen e-posta adresi
      'code': code,
      'password': newPassword,
      'password_confirmation': confirmPassword, // Laravel'in 'confirmed' kuralı için
    };

    try {
      final response = await dio.post(url, data: data);

      int ?error = response.statusCode;

      if (response.statusCode == 200) {

        showError("Şifreniz başarıyla sıfırlandı. Giriş yapabilirsiniz.");

        Navigator.popUntil(context, (route) => route.isFirst);
      } else {
        showError(response.data['message'] ?? 'Şifre sıfırlanırken bir hata oluştu.');
      }
    } catch (e) {
      if (e is DioException && e.response != null) {
        showError(e.response!.data['message'] ?? 'Bir hata oluştu: ${e.message}');
      } else {
        showError('Bir hata oluştu, lütfen tekrar deneyin: ${e.toString()}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Şifre Sıfırlama Onayı'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: SingleChildScrollView( // Klavye açıldığında içeriğin taşmasını önlemek için
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
              const SizedBox(height: 30),

              // Doğrulama Kodu TextField
              CustomTextField(
                icon: Icons.vpn_key,
                label: "Doğrulama Kodu",
                hint: "E-postanıza gelen kodu girin",
                controller: codeController,
                autofocus: true,
                isPassword: false,
                callback: (value) {},
              ),

              const SizedBox(height: 20),

              // Yeni Şifre TextField
              CustomTextField(
                icon: Icons.lock,
                autofocus: false,
                label: "Yeni Şifre",
                hint: "Yeni şifrenizi girin",
                controller: newPasswordController,
                isPassword: true, // Şifre alanı olduğu için maskele
                callback: (value) {},
              ),

              const SizedBox(height: 20),

              // Yeni Şifre Tekrar TextField
              CustomTextField(
                icon: Icons.lock,
                autofocus: false,
                label: "Yeni Şifre Tekrar",
                hint: "Yeni şifrenizi tekrar girin",
                controller: confirmPasswordController,
                isPassword: true, // Şifre alanı olduğu için maskele
                callback: (value) {},
              ),

              const SizedBox(height: 40),

              // Şifreyi Sıfırla Butonu
              SizedBox(
                height: 42,
                width: 150,
                child: CustomButton(
                  text: "Şifreyi Sıfırla",
                  snackText: "Şifre sıfırlanıyor...",
                  snack: false,
                  isNavigation: false,
                  onPress: true,
                  callback: (value) async {

                    if (value == "ok") {
                      await resetPassword();
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