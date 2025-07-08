import 'package:flutter/material.dart';
import 'package:login_page_flutter/home_page.dart';
import 'package:login_page_flutter/main.dart';
import 'package:login_page_flutter/widgets/custom_button.dart';
import 'package:login_page_flutter/widgets/custom_text_field.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Password Page',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PasswordPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PasswordPage extends StatelessWidget {
  const PasswordPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Came Özak'),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(child: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          margin:  EdgeInsets.all(20),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // İkon
              Container(
                margin:  EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(color: Colors.white70,borderRadius: BorderRadius.all(Radius.circular(20)),boxShadow: [BoxShadow(color: Colors.grey.withValues(alpha: 0.5),spreadRadius: 5,blurRadius: 15,offset: Offset(0, 3),),],),
                child:  Icon(Icons.person, size: 150, color: Colors.blue,),),
              Container(
                margin: EdgeInsets.only(top: 100, left: 20, right: 20),
                child: CustomTextField(icon: Icons.lock, label: "Şifre", autofocus: false, isPassword: true,),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 20,right: 20),
                child: CustomTextField(icon: Icons.lock, label: "Şifreyi Doğrula", autofocus: false, isPassword: true,),
              ),
              Container(
                height: 42,width: 95, margin: EdgeInsets.symmetric(horizontal: 100,vertical: 60),
                child:  CustomButton(destination: LoginPage(), text: "Onayla"),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

