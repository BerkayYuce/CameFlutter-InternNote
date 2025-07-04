import 'package:flutter/material.dart';
import 'package:login_page_flutter/password_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
            padding: EdgeInsets.all(20),
            margin:  EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // İkon
                Container(
                  margin:  EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.5),
                        spreadRadius: 5,
                        blurRadius: 15,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child:  Icon(
                    Icons.person,
                    size: 100,
                    color: Colors.blue,
                  ),
                ),

                // Kullanıcı Adı
                Container(
                  margin:  EdgeInsets.only(bottom: 15,top: 15),
                  child:  TextField(
                    decoration: InputDecoration(border: OutlineInputBorder(),
                      labelText: 'Kullanıcı Adı',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                ),

                // Şifre
                  Expanded(
                    child:
                    Container(
                      child:  TextField(
                        obscureText: true,
                        decoration: InputDecoration(border: OutlineInputBorder(),
                          labelText: 'Şifre',
                          prefixIcon: Icon(Icons.lock),
                        ),
                      ),
                    ),
                  ),
                Container(
                  margin: EdgeInsets.only(bottom: 300),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const PasswordPage(),));
                    },
                    child: Text('Şifremi unuttum',style: TextStyle(decoration: TextDecoration.underline)),

                  ),
                ),

                  /*
                  Container(
                    margin: EdgeInsets.only(),
                    child: TextButton(

                        onPressed: ,
                        child: const Text('Şifremi unuttum',style: TextStyle(decoration: TextDecoration.underline)),),
                  ), */
                // Giriş Butonu
                Container(
                  width: 106,  //200
                  height: 42, //45
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.5),
                      spreadRadius: 5,
                      blurRadius: 15,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                  child: ElevatedButton(
                    onPressed: () {
                      // Giriş butonuna basınca yapılacak işlem
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Giriş Yapıldı'),
                        ),
                      );
                    },
                    child:  Text('Giriş Yap'),
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
