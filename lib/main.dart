import 'package:flutter/material.dart';
import 'package:login_page_flutter/home_page.dart';
import 'package:login_page_flutter/password_page.dart';
import 'package:login_page_flutter/register_page.dart';

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
            margin:  EdgeInsets.all(9),
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
                    size: 150,
                    color: Colors.blue,
                  ),
                ),
                // Kullanıcı Adı
                Container(
                  margin:  EdgeInsets.only(bottom: 15,top: 15),
                  child:  TextField(
                    autofocus: false,
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
                        autofocus: false,
                        obscureText: true,
                        decoration: InputDecoration(border: OutlineInputBorder(),
                          labelText: 'Şifre',
                          prefixIcon: Icon(Icons.lock),
                        ),
                      ),
                    ),
                  ),
                Container(
                  margin: EdgeInsets.only(bottom: 250),
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const PasswordPage(),));},
                    child: Text('Şifremi unuttum',style: TextStyle(decoration: TextDecoration.underline,color:Colors.blue)),
                  ),
                ),
                /*
                Container(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const RegisterPage(),));
                    },
                    child: Text('Hesabın yok mu? Kayıt Ol',style: TextStyle(decoration: TextDecoration.underline,color:Colors.blue)),
                  ),
                ), */
                // Giriş Butonu
                Row(
                  children: [
                    Container(
                      width: 105,  //200
                      height: 40, //45
                      margin: EdgeInsets.only(left: 25),
                      alignment: Alignment.bottomLeft,
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

                          Navigator.push(context, MaterialPageRoute(builder: (context) => home_page(),));

                          /*
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Giriş Yapıldı'),
                            ),
                          ); */
                        },
                        child:  Text('Giriş Yap'),
                      ),
                    ),

                    Container(
                        width: 96,  //200
                        height: 40, //45
                        margin: EdgeInsets.only(left: 60),
                        alignment: Alignment.bottomRight,
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
                        /*child: IconButton(onPressed: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context) => const RegisterPage(),));
                        }, icon: Icon(Icons.add)),*/
                        child: ElevatedButton(
                          onPressed:(){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => const RegisterPage(),));
                          },
                          child: Text('Kayıt ol'),
                        )
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
