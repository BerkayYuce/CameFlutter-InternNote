import 'package:flutter/material.dart';

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

              Container(
                margin: EdgeInsets.only(top: 100, left: 20, right: 20),
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
                margin: EdgeInsets.symmetric(horizontal: 100,vertical: 110),
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

