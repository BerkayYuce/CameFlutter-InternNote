// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:login_page_flutter/new_password_page.dart';
// import 'package:login_page_flutter/services/httpStatusCodes.dart';
// import 'package:login_page_flutter/widgets/custom_button.dart';
// import 'package:login_page_flutter/widgets/custom_text_field.dart';
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
//   late bool onPressButton = false;
//   bool nullEmail = true;
//
//   @override
//   void dispose() {
//     emailController.dispose();
//     super.dispose();
//   }
//
//   void showError(String message) {
//     if (!mounted) return;
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
//   }
//
//
//   Future<void> sendVerificationCode(String email) async {
//
//
//     final dio = Dio();
//     final url = 'http://192.168.14.143:8000/api/send-password-reset-code';
//     final data = {'email': email};
//
//     try {
//       final response = await dio.post(url, data: data);
//
//       int ?error = response.statusCode;
//
//       if (!mounted) return; // Widget hâlâ aktif mi? Değilse çık.
//
//       if (response.statusCode == 200) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Şifre sıfırlama kodu e-posta adresinize gönderildi.')),
//         );
//
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => NewPasswordPage(email: email),
//           ),
//         );
//       } else {
//         //showError(response.data['message'] ?? 'Bir hata oluştu, lütfen tekrar deneyin.');
//
//           showError(HttpStatusCodes.getMessage(error!));
//
//       }
//     } catch (e) {
//       if (!mounted) return;
//
//       if (e is DioException && e.response != null) {
//         showError(e.response!.data['message'] ?? 'Bir hata oluştu: ${e.message}');
//       } else {
//         showError('Bir hata oluştu, lütfen tekrar deneyin. ${e.toString()}');
//       }
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
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
//         child: Center(
//           child: Container(
//             padding: const EdgeInsets.only(top: 110, bottom: 100),
//             margin: const EdgeInsets.all(0),
//             color: Colors.white,
//
//             child: Column(
//
//               mainAxisSize: MainAxisSize.min,
//
//               children: [
//
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
//
//                   child: const Icon(Icons.person, size: 150, color: Colors.blue),
//                 ),
//
//                 // TextField
//                 Container(
//                   margin: const EdgeInsets.only(top: 80, left: 30, right: 30),
//                   child: CustomTextField(
//                     icon: Icons.mail,
//                     label: "Email",
//                     autofocus: false,
//                     isPassword: false,
//                     isValid: !nullEmail,
//                     errorText: nullEmail ? "Email alanı boş bırakılamaz!" : null,
//                     hint: "example@gmail.com",
//                     controller: emailController,
//
//                     callback: (value) {
//
//                       setState(() {
//                         nullEmail = value.isEmpty;
//
//                       });
//
//                     },
//                   ),
//                 ),
//
//                 // Buton
//                 Container(
//                   height: 42,
//                   width: 95,
//                   margin: const EdgeInsets.symmetric(vertical: 60),
//
//                   child: CustomButton(
//                     text: "Gönder",
//                     snackText: null,
//                     snack: false,
//                     isNavigation: true,
//                     onPress: true,
//                     callback: (value) async {
//                       if (value == "ok") {
//
//                         setState(() {
//                           onPressButton = true;
//                         });
//
//                         final email = emailController.text.trim();
//
//
//                         if (email.isNotEmpty) {
//                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Kod gönderiliyor...")));
//                           await sendVerificationCode(email);
//                         } else {
//                           showError("Lütfen geçerli bir e-posta adresi girin.");
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

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:login_page_flutter/new_password_page.dart';
import 'package:login_page_flutter/services/httpStatusCodes.dart';
import 'package:login_page_flutter/widgets/custom_button.dart';
import 'package:login_page_flutter/widgets/custom_text_field.dart';

class PasswordPage extends StatefulWidget {
  PasswordPage({super.key});

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  final TextEditingController emailController = TextEditingController();
  bool isButtonPressed = false;
  bool isEmailValid = true;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  bool _isEmailValid(String email) {
    // Basit bir e-posta doğrulaması
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return regex.hasMatch(email);
  }

  Future<void> sendVerificationCode(String email) async {
    final dio = Dio();
    final url = 'http://192.168.14.143:8000/api/send-password-reset-code';
    final data = {'email': email};

    try {
      final response = await dio.post(url, data: data);

      int? error = response.statusCode;

      if (!mounted) return; // Widget hâlâ aktif mi? Değilse çık.

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Şifre sıfırlama kodu e-posta adresinize gönderildi.')),
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewPasswordPage(email: email),
          ),
        );
      } else {
        showError(HttpStatusCodes.getMessage(error!));
      }
    } catch (e) {
      if (!mounted) return;

      if (e is DioException && e.response != null) {
        showError(e.response!.data['message'] ?? 'Bir hata oluştu: ${e.message}');
      } else {
        showError('Bir hata oluştu, lütfen tekrar deneyin. ${e.toString()}');
      }
    }
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
            padding: const EdgeInsets.only(top: 110, bottom: 100),
            margin: const EdgeInsets.all(0),
            color: Colors.white,
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
                  margin: const EdgeInsets.only(top: 80, left: 30, right: 30),
                  child: CustomTextField(
                    icon: Icons.mail,
                    label: "Email",
                    autofocus: false,
                    isPassword: false,
                    isValid: isEmailValid,
                    errorText: isEmailValid ? null : "Geçersiz veya boş e-posta!",
                    hint: "example@gmail.com",
                    controller: emailController,
                    callback: (value) {
                      setState(() {
                        isEmailValid = _isEmailValid(value);
                      });
                    },
                  ),
                ),

                // Buton
                Container(
                  height: 42,
                  width: 95,
                  margin: const EdgeInsets.symmetric(vertical: 60),
                  child: CustomButton(
                    text: "Gönder",
                    snackText: null,
                    snack: false,
                    isNavigation: true,
                    onPress: true,
                    callback: (value) async {
                      if (value == "ok") {
                        setState(() {
                          isButtonPressed = true;
                        });

                        final email = emailController.text.trim();

                        if (email.isNotEmpty && isEmailValid) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Kod gönderiliyor...")));
                          await sendVerificationCode(email);
                        } else {
                          showError("Lütfen geçerli bir e-posta adresi girin.");
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
