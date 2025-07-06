/*
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: home_page(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class home_page extends StatelessWidget {
  home_page({super.key});

  final List<String> items = List.generate(20, (index) => 'Öğe ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // HEADER
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Text(
                  'Giriş Başarılı',
                  style: TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Bugünkü görevlerin aşağıda listelendi.',
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
              ],
            ),
          ),

          // LİSTE
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(20),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.only(bottom: 10),
                  elevation: 3,
                  child: ListTile(
                    leading: Icon(Icons.task),
                    title: Text(items[index]),
                    trailing: Icon(Icons.expand_more, size: 16),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';

class home_page extends StatelessWidget {
  final List<Map<String, String>> items = List.generate(
    20,
        (index) => {
      'title': 'Öğe ${index + 1}',
      'description': 'Bu, ${index + 1}. öğenin açıklamasıdır. Daha fazla bilgi buraya yazılabilir.',
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // HEADER
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.blue.shade700,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hoşgeldin Berkay',
                  style: TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Görevlerin aşağıda listelendi.',
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
              ],
            ),
          ),

          // LİSTE
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(20),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Card(
                  margin: EdgeInsets.only(bottom: 10),
                  elevation: 5,
                  child: ExpansionTile(
                    leading: Icon(Icons.task),
                    title: Text(item['title']!),
                    trailing: Icon(Icons.expand_more), // ↓ ikon
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        child: Text(
                          item['description']!,
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}



