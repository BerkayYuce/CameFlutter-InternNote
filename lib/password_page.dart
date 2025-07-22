import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:login_page_flutter/widgets/custom_button.dart';
import 'package:login_page_flutter/widgets/custom_text_field.dart';

class PasswordPage extends StatefulWidget {
  PasswordPage({super.key});

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {

  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)));
  }


  Future<void> sendResetLink(String email) async {

    final dio = Dio();
    final url = 'http://192.168.14.143:8000/api/forgot-password';
    final data = {'email': email};

    try {
      final response = await dio.post(url, data: data);

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Şifre sıfırlama linki e-posta adresinize gönderildi.')),
        );
      } else {
        showError('Bir hata oluştu, lütfen tekrar deneyin.');
      }
    } catch (e) {
      showError('Bir hata oluştu, lütfen tekrar deneyin. ${e.toString()}');
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
            padding: EdgeInsets.only(top: 110, bottom: 100),
            margin: EdgeInsets.all(0),
            color: Colors.white,

            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [

                // İkon
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 15,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Icon(Icons.person, size: 150, color: Colors.blue),
                ),

                // TextField
                Container(
                  margin: EdgeInsets.only(top: 80, left: 30, right: 30),
                  child: CustomTextField(
                    icon: Icons.mail,
                    label: "Email",
                    autofocus: false,
                    isPassword: false,
                    hint: "example@gmail.com",
                    controller: emailController,

                    callback: (value) {



                    },
                  ),
                ),


                // Buton
                Container(
                  height: 42,
                  width: 95,
                  margin: EdgeInsets.symmetric(vertical: 60),

                  child: CustomButton(
                    text: "Gönder",
                    snackText: "Kod gönderildi",
                    snack: true,
                    isNavigation: true,
                    onPress: true,

                    callback: (value) async {

                      if (value == "ok") {

                        final email = emailController.text.trim();

                        if (email.isNotEmpty) {
                          await sendResetLink(email);
                        }
                        else
                        {
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


