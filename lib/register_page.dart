import 'package:flutter/material.dart';
import 'package:login_page_flutter/main.dart';
import 'package:login_page_flutter/widgets/custom_button.dart';
import 'package:login_page_flutter/widgets/custom_text_field.dart';
import 'package:dio/dio.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

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

  bool nullName = false;
  bool nullUsername = false;
  bool nullPassword = false;
  bool nullPassword2 = false;

  final Dio _dio = Dio(
    BaseOptions(
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
                    isValid: !nullName,
                    callback: (value) {

                      setState(() {
                        nullName = value.isEmpty;

                      });

                    },
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
                    errorText: nullUsername ? "Kullanıcı adı boş bırakılamaz!" : null,
                    controller: usernameController,
                    isValid: !nullUsername,
                    callback: (value) {

                      setState(() {
                        nullUsername = value.isEmpty;

                      });

                    },
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
                    errorText: nullPassword ? "Şifre alanı boş bırakılamaz!" : null,
                    isValid: !nullPassword,
                    callback: (value) {

                      setState(() {
                        nullPassword = value.isEmpty;

                      });

                    },
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
                    errorText: nullPassword2 ? "Şifre alanı boş bırakılamaz" : null,
                    isValid: !nullPassword2,

                    callback: (value) {

                      setState(() {
                        nullPassword2 = value.isEmpty;

                      });

                    },
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


                          final response = await Dio().post(
                            'http://192.168.14.143:8000/api/register',
                            //'http://127.0.0.1/camelaravel.test/api/register',
                            data: {
                              'name': name,
                              'email': username,
                              'password': password,
                              "password_confirmation": password,
                              "device_name": "flutter_app"
                            },
                            options: Options(
                              headers: {'Accept': 'application/json'},
                              followRedirects: true, // Yönlendirmeleri otomatik takip et
                              validateStatus: (status) {
                                return status != null && status < 400; // 3xx ve altı geçerli say
                              },
                            ),
                          );
                          print(response);

                          // API'den başarılı bir yanıt geldiyse
                          if (response.statusCode == 200 || response.statusCode == 201) {
                            showError("Kayıt başarılı!");

                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                          } else {

                            //showError("Kayıt başarısız oldu: ${response.data['message'] ?? 'Bilinmeyen bir hata oluştu.'}");
                            showError("Kayıt başarısız oldu: ");
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

