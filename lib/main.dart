import 'package:flutter/material.dart';
import 'package:login_page_flutter/home_page.dart';
import 'package:login_page_flutter/password_page.dart';
import 'package:login_page_flutter/register_page.dart';
import 'package:login_page_flutter/widgets/custom_button.dart';
import 'package:login_page_flutter/widgets/custom_text_field.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(primarySwatch: Colors.blue),
      home:  LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class LoginPage extends StatelessWidget {
  LoginPage({super.key});


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
            padding: EdgeInsets.all(20),margin:  EdgeInsets.all(9),
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15),),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // İkon
                Container(
                  margin:  EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(color: Colors.white70,borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [BoxShadow(color: Colors.grey.withValues(alpha: 0.5),spreadRadius: 5, blurRadius: 15,offset: Offset(0, 3),),],),
                  child:  Icon(Icons.person,size: 150,color: Colors.blue,),
                ),
                // Kullanıcı Adı
                Container(
                  margin:  EdgeInsets.only(bottom: 15,top: 15),
                  child: CustomTextField(icon: Icons.person, label: "Kullanıcı Adı", autofocus: true, isPassword: false,hint: "example@gmail.com",),
                ),
                // Şifre
                Container(
                        child: CustomTextField(icon: Icons.lock, label: "Şifre", autofocus: false, isPassword: true,hint: "",)
                ),

                Container(
                  margin: EdgeInsets.only(bottom: 200,top: 15), alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const PasswordPage(),));},
                    child: Text('Şifremi unuttum',style: TextStyle(decoration: TextDecoration.underline,color:Colors.blue)),
                  ),
                ),
                // Giriş Butonu
                Row(
                  children: [
                    Container(
                      width: 105,height: 40,margin: EdgeInsets.only(left: 25, bottom: 30),alignment: Alignment.bottomLeft,
                      child: CustomButton(destination: home_page(), text: "Giriş yap",snackText: "", isSnack: false,),
                    ),
                    Container(
                        width: 96,height: 40,margin: EdgeInsets.only(left: 60, bottom: 30),alignment: Alignment.bottomRight,
                         child: CustomButton(destination: RegisterPage(), text: 'Kayıt ol',snackText: "", isSnack: false,),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
