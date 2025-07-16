import 'package:flutter/material.dart';
import 'package:login_page_flutter/main.dart';
import 'package:login_page_flutter/widgets/custom_button.dart';
import 'package:login_page_flutter/widgets/custom_text_field.dart';
import 'package:dio/dio.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://cameLaravel.test/api',
      connectTimeout: const Duration(seconds: 5), // Bağlantı zaman aşımı
      receiveTimeout: const Duration(seconds: 3), // Veri alma zaman aşımı
    ),
  );


  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
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
                Container(
                  margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
                  child: CustomTextField(
                    icon: Icons.person_add,
                    label: "İsim",
                    autofocus: false,
                    isPassword: false,
                    hint: "...",
                    controller: nameController,
                    callback: (value) {},
                  ),
                ),
                // Kullanıcı Adı
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
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
                  margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 70),
                  child: CustomButton(
                    //destination: RegisterPage(),
                    text: "Onayla",
                    snackText: "",
                    snack: false,
                    isNavigation: true,
                    onPress: true,
                    callback: (value) async {
                      if (value == "ok") {

                        final username = usernameController.text.trim();
                        final password = passwordController.text.trim();
                        final confirmPassword = confirmPasswordController.text.trim();
                        final name = nameController.text.trim();

                        if (username.isEmpty || password.isEmpty || confirmPassword.isEmpty || name.isEmpty) {
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


                        
                        try {
                          final response = await _dio.post(
                            '/register',
                            data: {
                              'name': name,
                              'username': username,
                              'password': password,
                              "password_confirmation": password,
                              "device_name": "flutter_app"
                            },
                          );

                          // API'den başarılı bir yanıt geldiyse
                          if (response.statusCode == 200 || response.statusCode == 201) {
                            showError("Kayıt başarılı!");

                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                          } else {

                            showError("Kayıt başarısız oldu: ${response.data['message'] ?? 'Bilinmeyen bir hata oluştu.'}");
                          }
                        } on DioException catch (e) {
                          // Dio'dan gelen spesifik hataları yakala
                          if (e.response != null) {
                            // Sunucudan hata yanıtı geldiyse
                            showError("Sunucu hatası: ${e.response?.data['message'] ?? 'Bilinmeyen sunucu yanıtı.'}");

                          } else {
                            // Ağ bağlantısı sorunları, zaman aşımı vb. hatalar
                            showError("İstek gönderilirken bir hata oluştu: Lütfen internet bağlantınızı kontrol edin.");
                          }
                          print("Dio Hatası: $e"); // Hata detaylarını konsola yazdır
                        } catch (e) {
                          // Diğer genel hataları yakala
                          showError("Beklenmedik bir hata oluştu: ${e.toString()}");
                          print("Genel Hata: $e"); // Hata detaylarını konsola yazdır
                        }

                       //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                        //showError("Kayıt başarılı!");
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

