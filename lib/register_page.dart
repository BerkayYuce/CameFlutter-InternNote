// import 'package:flutter/material.dart';
// import 'package:login_page_flutter/main.dart';
// import 'package:login_page_flutter/services/httpStatusCodes.dart';
// import 'package:login_page_flutter/widgets/custom_button.dart';
// import 'package:login_page_flutter/widgets/custom_text_field.dart';
// import 'package:dio/dio.dart';
// import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
//
// class RegisterPage extends StatefulWidget {
//
//   const RegisterPage({super.key});
//   // final String email;
//   // const RegisterPage({Key? key, required this.email}) : super(key: key);
//
//
//
//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
// }
//
// class _RegisterPageState extends State<RegisterPage> {
//
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController = TextEditingController();
//
//   bool nullName = false;
//   bool nullUsername = false;
//   bool nullPassword = false;
//   bool nullPassword2 = false;
//
//   final Dio _dio = Dio(
//     BaseOptions(
//       connectTimeout: const Duration(seconds: 5), // Bağlantı zaman aşımı
//       receiveTimeout: const Duration(seconds: 3), // Veri alma zaman aşımı
//     ),
//   );
//
//
//   void showError(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message)),
//     );
//   }
//
//   @override
//   void dispose() {
//     nameController.dispose();
//     usernameController.dispose();
//     passwordController.dispose();
//     confirmPasswordController.dispose();
//     super.dispose();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//
//       resizeToAvoidBottomInset: false,
//
//       appBar: AppBar(
//         title: const Text('Came Özak'),
//         backgroundColor: Colors.blue,
//       ),
//
//       body: SafeArea(
//
//         child: Center(
//
//           child: Container(
//             padding: const EdgeInsets.all(10),
//             color: Colors.white,
//
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//
//                 // İkon
//                 Container(
//                   margin: const EdgeInsets.only(bottom: 10),
//                   decoration: BoxDecoration(
//                     color: Colors.white70,
//                     borderRadius: BorderRadius.circular(20),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         spreadRadius: 5,
//                         blurRadius: 15,
//                         offset: const Offset(0, 3),
//                       ),
//                     ],
//                   ),
//
//                   child: const Icon(Icons.person_add, size: 150, color: Colors.blue),
//                 ),
//
//
//                 Container(
//                   margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
//                   child: CustomTextField(
//                     icon: Icons.person_add,
//                     label: "İsim",
//                     autofocus: false,
//                     isPassword: false,
//                     hint: "...",
//                     controller: nameController,
//                     isValid: !nullName,
//                     callback: (value) {
//
//                       setState(() {
//                         nullName = value.isEmpty;
//
//                       });
//
//                     },
//                   ),
//                 ),
//
//
//                 // Kullanıcı Adı
//                 Container(
//                   margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
//                   child: CustomTextField(
//                     icon: Icons.person_add,
//                     label: "Kullanıcı Adı",
//                     autofocus: false,
//                     isPassword: false,
//                     hint: "example@gmail.com",
//                     errorText: nullUsername ? "Kullanıcı adı boş bırakılamaz!" : null,
//                     controller: usernameController,
//                     isValid: !nullUsername,
//                     callback: (value) {
//
//                       setState(() {
//                         nullUsername = value.isEmpty;
//
//                       });
//
//                     },
//                   ),
//                 ),
//
//
//                 // Şifre
//                 Container(
//                   margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
//                   child: CustomTextField(
//                     icon: Icons.lock,
//                     label: "Şifre",
//                     autofocus: false,
//                     isPassword: true,
//                     hint: "",
//                     controller: passwordController,
//                     errorText: nullPassword ? "Şifre alanı boş bırakılamaz!" : null,
//                     isValid: !nullPassword,
//                     callback: (value) {
//
//                       setState(() {
//                         nullPassword = value.isEmpty;
//
//                       });
//
//                     },
//                   ),
//                 ),
//
//
//                 // Şifre Doğrulama
//                 Container(
//                   margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
//                   child: CustomTextField(
//                     icon: Icons.lock,
//                     label: "Şifreyi Doğrula",
//                     autofocus: false,
//                     isPassword: true,
//                     hint: "",
//                     controller: confirmPasswordController,
//                     errorText: nullPassword2 ? "Şifre alanı boş bırakılamaz" : null,
//                     isValid: !nullPassword2,
//
//                     callback: (value) {
//
//                       setState(() {
//                         nullPassword2 = value.isEmpty;
//
//                       });
//
//                     },
//                   ),
//                 ),
//
//
//                 // Onayla Butonu
//                 Container(
//                   height: 42,
//                   width: 95,
//                   margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 70),
//                   child: CustomButton(
//                     //destination: RegisterPage(),
//                     text: "Onayla",
//                     snackText: "",
//                     snack: false,
//                     isNavigation: true,
//                     onPress: true,
//                     callback: (value) async {
//                       if (value == "ok") {
//
//                         final username = usernameController.text.trim();
//                         final password = passwordController.text.trim();
//                         final confirmPassword = confirmPasswordController.text.trim();
//                         final name = nameController.text.trim();
//
//                         if (username.isEmpty || password.isEmpty || confirmPassword.isEmpty || name.isEmpty) {
//                           showError("Tüm alanlar doldurulmalı");
//                           return;
//                         }
//
//                         if (!username.contains("@") || !username.contains(".")) {
//                           showError("Geçerli bir e-posta adresi giriniz");
//                           return;
//                         }
//
//                         if (password.length < 6) {
//                           showError("Şifre en az 6 karakter olmalı");
//                           return;
//                         }
//
//                         if (password != confirmPassword) {
//                           showError("Şifreler eşleşmiyor");
//                           return;
//                         }
//
//
//                           final response = await Dio().post(
//                             'http://192.168.14.143:8000/api/register',
//                             //'http://127.0.0.1/camelaravel.test/api/register',
//                             data: {
//                               'name': name,
//                               'email': username,
//                               'password': password,
//                               "password_confirmation": password,
//                               "device_name": "flutter_app"
//                             },
//                             options: Options(
//                               headers: {'Accept': 'application/json'},
//                               followRedirects: true, // Yönlendirmeleri otomatik takip et
//                               validateStatus: (status) {
//                                 return status != null && status < 500;
//                               },
//                             ),
//                           );
//                           print(response);
//
//                           // API'den başarılı bir yanıt geldiyse
//                           if (response.statusCode == 200 || response.statusCode == 201) {
//                             showError("Kayıt başarılı!");
//
//                             Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
//                           } else {
//
//                             int? error = response.statusCode;
//                             showError(HttpStatusCodes.getMessage(error!));
//
//                           }
//
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



import 'package:flutter/material.dart';
import 'package:login_page_flutter/main.dart'; // LoginPage'e dönmek için
import 'package:login_page_flutter/services/httpStatusCodes.dart';
import 'package:login_page_flutter/widgets/custom_button.dart';
import 'package:login_page_flutter/widgets/custom_text_field.dart';
import 'package:dio/dio.dart';
import 'package:login_page_flutter/verify_registration_email_page.dart'; // Yeni doğrulama sayfası

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController(); // username yerine email
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool nullName = false;
  bool nullEmail = false; // nullUsername yerine nullEmail
  bool nullPassword = false;
  bool nullPassword2 = false;
  bool _isLoading = false; // Yükleme durumu için

  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 5), // Bağlantı zaman aşımı
      receiveTimeout: const Duration(seconds: 3), // Veri alma zaman aşımı
    ),
  );

  void showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  bool _isEmailValid(String email) {
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return regex.hasMatch(email);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
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

                // Email Adresi
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: CustomTextField(
                    icon: Icons.mail, // Mail ikonu kullanıldı
                    label: "Email",
                    autofocus: false,
                    isPassword: false,
                    hint: "example@gmail.com",
                    errorText: nullEmail ? "Email boş bırakılamaz!" : null,
                    controller: emailController, // usernameController yerine emailController
                    isValid: !nullEmail,
                    callback: (value) {
                      setState(() {
                        nullEmail = value.isEmpty;
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
                    text: _isLoading ? "Gönderiliyor..." : "Kayıt Ol",
                    snackText: "",
                    snack: false,
                    isNavigation: false, // Artık doğrudan navigasyon yapmayacak
                    onPress: !_isLoading, // Yüklenirken devre dışı bırak
                    callback: (value) async {
                      if (value == "ok" && !_isLoading) {
                        setState(() {
                          _isLoading = true; // Yüklemeyi başlat
                        });

                        final name = nameController.text.trim();
                        final email = emailController.text.trim(); // username yerine email
                        final password = passwordController.text.trim();
                        final confirmPassword = confirmPasswordController.text.trim();

                        if (name.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
                          showError("Tüm alanlar doldurulmalı");
                          setState(() { _isLoading = false; });
                          return;
                        }

                        if (!_isEmailValid(email)) {
                          showError("Geçerli bir e-posta adresi giriniz");
                          setState(() { _isLoading = false; });
                          return;
                        }

                        if (password.length < 8) { // Laravel'deki min:8 kuralına uygun
                          showError("Şifre en az 8 karakter olmalı");
                          setState(() { _isLoading = false; });
                          return;
                        }

                        if (password != confirmPassword) {
                          showError("Şifreler eşleşmiyor");
                          setState(() { _isLoading = false; });
                          return;
                        }

                        try {
                          final response = await _dio.post(
                            'http://192.168.14.143:8000/api/register',
                            data: {
                              'name': name,
                              'email': email,
                              'password': password,
                              "password_confirmation": confirmPassword, // confirmPassword kullanıldı
                            },
                            options: Options(
                              headers: {'Accept': 'application/json'},
                              validateStatus: (status) {
                                return status != null && status < 500;
                              },
                            ),
                          );

                          if (response.statusCode == 200) {
                            showError(response.data['message'] ?? "Doğrulama kodu gönderildi!");
                            // Kullanıcıyı doğrulama sayfasına yönlendir
                            if (mounted) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VerifyRegistrationEmailPage(
                                    email: email,
                                    name: name,
                                    password: password,
                                    passwordConfirmation: confirmPassword,
                                  ),
                                ),
                              );
                            }
                          } else {
                            // API'den gelen spesifik hata mesajını göster
                            String errorMessage = "Kayıt başarısız oldu.";
                            if (response.data != null && response.data is Map && response.data.containsKey('message')) {
                              errorMessage = response.data['message'];
                            } else {
                              int? error = response.statusCode;
                              errorMessage = HttpStatusCodes.getMessage(error!);
                            }
                            showError(errorMessage);
                          }
                        } on DioException catch (e) {
                          if (!mounted) return;
                          String errorMessage = "Bir hata oluştu.";
                          if (e.response != null) {
                            // Sunucudan gelen hata yanıtı varsa
                            if (e.response!.data != null && e.response!.data is Map && e.response!.data.containsKey('message')) {
                              errorMessage = e.response!.data['message'];
                            } else if (e.response!.statusCode == 422) { // Doğrulama hatası
                              errorMessage = "Girilen bilgilerde hata var.";
                              if (e.response!.data != null && e.response!.data is Map && e.response!.data.containsKey('errors')) {
                                Map<String, dynamic> errors = e.response!.data['errors'];
                                // 'email' alanında spesifik bir hata varsa onu göster
                                if (errors.containsKey('email')) {
                                  errorMessage = errors['email'][0]; // "Email zaten alınmış." gibi
                                } else if (errors.containsKey('password')) { // Şifre doğrulamada hata varsa
                                  errorMessage = errors['password'][0];
                                }
                                // Diğer alanlar için de benzer kontroller eklenebilir
                              }
                            } else {
                              errorMessage = "Sunucu hatası: ${e.response?.statusCode ?? 'Bilinmeyen'}";
                            }
                          } else {
                            // Ağ hatası (internet yok, zaman aşımı vb.)
                            errorMessage = 'İnternet bağlantınızı kontrol edin.';
                          }
                          showError(errorMessage);
                          print("Dio Hata: $e");
                        } catch (e) {
                          if (!mounted) return;
                          showError('Beklenmedik bir hata oluştu: ${e.toString()}');
                          print("Genel Hata: $e");
                        } finally {
                          setState(() {
                            _isLoading = false; // Yüklemeyi durdur
                          });
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