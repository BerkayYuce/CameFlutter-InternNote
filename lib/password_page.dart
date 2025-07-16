import 'package:flutter/material.dart';
import 'package:login_page_flutter/widgets/custom_button.dart';
import 'package:login_page_flutter/widgets/custom_text_field.dart';
import 'package:login_page_flutter/register_page.dart';

class PasswordPage extends StatefulWidget {
  PasswordPage({super.key});

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
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
                    controller: passwordController,
                    callback: (value) {
                      // burada kullanıcı girişini alabilirsin
                    },
                  ),
                ),
                // Buton
                Container(
                  height: 42,
                  width: 95,
                  margin: EdgeInsets.symmetric(vertical: 60),
                  child: CustomButton(
                    //destination: PasswordPage(),
                    text: "Gönder",
                    snackText: "Kod gönderildi",
                    snack: true,
                    isNavigation: true,
                    onPress: true, // Artık butona basılsın istiyorsan true yap
                    callback: (value) {
                      if (value == "ok") {
                        // buraya gönderme işlemini yaz
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Kod gönderildi")),
                        );
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
