// lib/pages/profile_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page_flutter/bloc/profile/profile_bloc.dart';
import 'package:login_page_flutter/widgets/custom_button.dart';
import 'package:login_page_flutter/widgets/custom_text_field.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(const ProfileEvent.profileInfoRequested());
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    oldPasswordController.dispose();
    newPasswordController.dispose();
    super.dispose();
  }

  void _showSnackBar(String message, {bool isError = true}) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Sayfası'),
        backgroundColor: Colors.blue,
      ),
      body: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          state.maybeWhen(
            loaded: (user, message) {
              if (message != null) {
                _showSnackBar(message, isError: false);
              }
            },
            error: (message) {
              _showSnackBar(message, isError: true);
            },
            orElse: () => null,
          );
        },
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return state.maybeWhen(
              // YÜKLENİYOR durumu için loading spinner göster
              loading: () => const Center(child: CircularProgressIndicator()),

              // BAŞARILI YÜKLENDİ durumunda UI'ı göster ve controller'ları doldur
              loaded: (user, message) {
                nameController.text = user['name']?.toString() ?? '';
                emailController.text = user['email']?.toString() ?? '';

                return SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Profil Bilgilerini Güncelle',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        icon: Icons.person,
                        label: "Ad Soyad",
                        controller: nameController,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        icon: Icons.email,
                        label: "E-posta",
                        controller: emailController,
                        readOnly: true, // E-posta adresini değiştirmeyi engellemek için
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        text: 'Profili Güncelle',
                        onPressed: () {
                          context.read<ProfileBloc>().add(
                            ProfileEvent.profileUpdateRequested(
                              name: nameController.text.trim(),
                              email: emailController.text.trim(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 40),
                      const Divider(),
                      const SizedBox(height: 40),
                      const Text(
                        'Şifre Değiştir',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        icon: Icons.lock,
                        label: "Eski Şifre",
                        controller: oldPasswordController,
                        isPassword: true,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        icon: Icons.lock_open,
                        label: "Yeni Şifre",
                        controller: newPasswordController,
                        isPassword: true,
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        text: 'Şifreyi Değiştir',
                        onPressed: () {
                          context.read<ProfileBloc>().add(
                            ProfileEvent.passwordChangeRequested(
                              oldPassword: oldPasswordController.text.trim(),
                              newPassword: newPasswordController.text.trim(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
              // Hata veya Başlangıç durumu için de loading spinner göster.
              orElse: () => const Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }
}