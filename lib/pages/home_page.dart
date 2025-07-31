// lib/pages/home_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page_flutter/bloc/auth/auth_bloc.dart';
import 'package:login_page_flutter/bloc/auth/auth_event.dart';
import 'package:login_page_flutter/bloc/auth/auth_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<Map<String, String>> items = List.generate(
    20,
        (index) => {
      'title': 'Öğe ${index + 1}',
      'description': 'Bu, ${index + 1}. öğenin açıklamasıdır. Daha fazla bilgi buraya yazılabilir.',
    },
  );

  @override
  Widget build(BuildContext context) {

    print('🚀 HomePage: build metodu çağrıldı. HomePage yükleniyor.');

    return Scaffold(
      body: Column(
        children: [

          // HEADER
          Container(

            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),

            decoration: BoxDecoration(
              color: Colors.blue.shade700,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Align(
                  alignment: Alignment.topRight,

                  child: BlocListener<AuthBloc, AuthState>( // BlocListener sadece logout event'ini dinleyecek

                    listener: (context, state) {

                      state.maybeWhen(

                        error: (message) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Çıkış Hatası: $message'), backgroundColor: Colors.red),
                          );
                        },

                        orElse: () => null,
                      );
                    },

                    child: IconButton(
                      icon: const Icon(Icons.logout, color: Colors.white, size: 30),

                      onPressed: () {
                        // Freezed event'i doğru şekilde çağır
                        context.read<AuthBloc>().add(const AuthEvent.logoutRequested());
                      },

                      tooltip: 'Çıkış Yap',
                    ),
                  ),
                ),

                // Kullanıcı adını BlocBuilder ile AuthBloc'tan al
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {

                    String userName = 'Misafir'; // Varsayılan değer

                    state.whenOrNull(

                      success: (message, authToken, rememberMeToken, user) {

                        if (user != null && user.containsKey('name')) {

                          userName = user['name'].toString();

                        } else {

                          userName = 'Hoş Geldin!'; // Kullanıcı objesi var ama isim yoksa
                        }
                      },

                      // Diğer durumlar için herhangi bir şey yapmaya gerek yok, varsayılan 'Misafir' kalır
                      // AuthInitial veya AuthLoading gibi durumlarda buraya gelinmemeli,
                      // çünkü main.dart bunları farklı sayfalara yönlendirecektir.
                      // Ancak olası bir senaryo için varsayılan değer mantıklı.

                    );


                    return Text(

                      'Hoş geldin, $userName!',

                      style: const TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),
                    );
                  },
                ),

                const SizedBox(height: 8),

                const Text(
                  'Görevlerin aşağıda listelendi.',
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(

              padding: const EdgeInsets.all(20),
              itemCount: items.length,
              itemBuilder: (context, index) {

                final item = items[index];
                return Card(

                  margin: const EdgeInsets.only(bottom: 10),
                  elevation: 5,

                  child: ExpansionTile(
                    leading: const Icon(Icons.task),
                    title: Text(item['title']!),
                    trailing: const Icon(Icons.expand_more),
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