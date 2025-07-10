
import 'package:flutter/material.dart';
import 'package:login_page_flutter/widgets/custom_button.dart';
import 'package:login_page_flutter/widgets/custom_text_field.dart';
import 'package:login_page_flutter/home_page.dart';
import 'package:login_page_flutter/main.dart';
import 'package:login_page_flutter/register_page.dart';

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
          padding: EdgeInsets.only(top:110,bottom: 100),
          margin:  EdgeInsets.all(0),
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
                margin: EdgeInsets.only(top: 80, left: 30, right: 30),
                child: CustomTextField(icon: Icons.mail, label: "Email", autofocus: false, isPassword: false,hint: "example@gmail.com",callback: (value){},),
              ),
              Container(
                height: 42,width: 95, margin: EdgeInsets.symmetric(vertical: 60),
                child:  CustomButton(destination: PasswordPage(), text: "Gönder",snackText: "Kod gönderildi",isSnack: true,isNavigation: true,onPress: false,callback:(value){

                } ,),

              ),

            ],
          ),
        ),
      )),
    );
  }
}

