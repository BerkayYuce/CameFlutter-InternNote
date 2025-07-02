import 'package:flutter/material.dart';

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
                  child:  Icon(
                    Icons.person,
                    size: 100,
                    color: Colors.blue,
                  ),
                ),

                // Kullanıcı Adı
                Container(
                  margin:  EdgeInsets.only(bottom: 15),
                  child:  TextField(
                    decoration: InputDecoration(
                      labelText: 'Kullanıcı Adı',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                ),

                // Şifre
                Container(
                  margin:  EdgeInsets.only(bottom: 20),
                  child:  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Şifre',
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                ),

                // Giriş Butonu
                Container(
                  width: 250,
                  height: 45,
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
