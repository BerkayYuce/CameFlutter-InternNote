import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register Page',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const RegisterPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RegisterPage extends StatelessWidget {
  const RegisterPage ({super.key});

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
          padding: EdgeInsets.all(10),
          margin:  EdgeInsets.all(15),
          color: Colors.white,
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
                  Icons.person_add,
                  size: 150,
                  color: Colors.blue,
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 50, left: 20, right: 20),
                child: TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person_add),
                    labelText: 'Kullanıcı adı',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                      labelText: 'Şifre'
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 20,right: 20),
                child: TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(),
                    labelText: 'Şifreyi Doğrula',
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
              ),
              Container(
                height: 42,
                width: 95,
                margin: EdgeInsets.symmetric(horizontal: 100,vertical: 90),
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
                    onPressed: (){
                      //İşlem
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Şifre Değişti'),
                        ),
                      );
                    },
                    child: Text('Onayla')),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

