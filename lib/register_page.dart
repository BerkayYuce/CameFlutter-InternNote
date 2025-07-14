import 'package:flutter/material.dart';
import 'package:login_page_flutter/main.dart';
import 'package:login_page_flutter/widgets/custom_button.dart';
import 'package:login_page_flutter/widgets/custom_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Came Özak'),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(10),
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // İkon
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 15,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.person_add, size: 150, color: Colors.blue),
                ),
                // Kullanıcı Adı
                Container(
                  margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
                  child: CustomTextField(
                    icon: Icons.person_add,
                    label: "Kullanıcı Adı",
                    autofocus: false,
                    isPassword: false,
                    hint: "example@gmail.com",
                    controller: usernameController,
                    callback: (value) {},
                  ),
                ),
                // Şifre
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: CustomTextField(
                    icon: Icons.lock,
                    label: "Şifre",
                    autofocus: false,
                    isPassword: true,
                    hint: "",
                    controller: passwordController,
                    callback: (value) {},
                  ),
                ),
                // Şifre Doğrulama
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: CustomTextField(
                    icon: Icons.lock,
                    label: "Şifreyi Doğrula",
                    autofocus: false,
                    isPassword: true,
                    hint: "",
                    controller: confirmPasswordController,
                    callback: (value) {},
                  ),
                ),
                // Onayla Butonu
                Container(
                  height: 42,
                  width: 95,
                  margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 80),
                  child: CustomButton(
                    destination: LoginPage(),
                    text: "Onayla",
                    snackText: "",
                    snack: false,
                    isNavigation: true,
                    onPress: true,
                    callback: (value) {
                      final username = usernameController.text.trim();
                      final password = passwordController.text.trim();
                      final confirmPassword = confirmPasswordController.text.trim();

                      if (username.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
                        showError("Tüm alanlar doldurulmalı");
                        return;
                      }

                      if (!username.contains("@") || !username.contains(".")) {
                        showError("Geçerli bir e-posta adresi giriniz");
                        return;
                      }

                      if (password.length < 6) {
                        showError("Şifre en az 6 karakter olmalı");
                        return;
                      }

                      if (password != confirmPassword) {
                        showError("Şifreler eşleşmiyor");
                        return;
                      }

                      // başarılıysa giriş sayfasına yönlendir
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
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
