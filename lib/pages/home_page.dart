// lib/pages/home_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page_flutter/bloc/auth/auth_bloc.dart';
import 'package:login_page_flutter/bloc/auth/auth_event.dart';
import 'package:login_page_flutter/bloc/auth/auth_state.dart';
import 'package:login_page_flutter/pages/login_page.dart';
import 'package:login_page_flutter/pages/profile_page.dart'; // Yeni import

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> items = List.generate(
    30,
        (index) => {
      'title': 'Staj gün ${index + 1}',
      'description': 'Bu, ${index + 1}. günün açıklamasıdır. Daha fazla bilgi buraya yazılabilir.',
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
                  child: Row(
                    mainAxisSize: MainAxisSize.min, // Eklenen Row'un boyutunu minimuma indirdik
                    children: [
                      // PROFİL SAYFASINA GİTME BUTONU
                      IconButton(
                        icon: const Icon(Icons.account_circle, color: Colors.white, size: 30),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ProfilePage()),
                          );
                        },
                        tooltip: 'Profil Sayfası',
                      ),
                      const SizedBox(width: 10),
                      // ÇIKIŞ BUTONU
                      BlocListener<AuthBloc, AuthState>(
                        listener: (context, state) {
                          state.maybeWhen(
                            initial: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (context) => const LoginPage()),
                                    (Route<dynamic> route) => false,
                              );
                            },
                            error: (message) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Çıkış Hatası: $message'), backgroundColor: Colors.red),
                              );
                            },
                            orElse: () => null,
                          );
                        },
                        child: BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            final isLoading = state is AuthLoading;
                            return IconButton(
                              icon: isLoading
                                  ? const CircularProgressIndicator(color: Colors.white)
                                  : const Icon(Icons.logout, color: Colors.white, size: 30),
                              onPressed: isLoading
                                  ? null
                                  : () {
                                context.read<AuthBloc>().add(const AuthEvent.logoutRequested());
                              },
                              tooltip: 'Çıkış Yap',
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    String userName = 'Misafir';
                    String userEmail = 'Email bilgisi yok';
                    state.maybeWhen(
                      success: (message, authToken, rememberMeToken, user) {
                        if (user != null) {
                          if (user.containsKey('name')) {
                            userName = user['name'].toString();
                          }
                          if (user.containsKey('email')) {
                            userEmail = user['email'].toString();
                          }
                        }
                      },
                      orElse: () => null,
                    );
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hoş geldin, $userName!',
                          style: const TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          userEmail, // Kullanıcının e-posta adresini gösteren widget
                          style: const TextStyle(fontSize: 16, color: Colors.white70),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 8),
                const Text(
                  'Staj günlerin aşağıda listelendi.',
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