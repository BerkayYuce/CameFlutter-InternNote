import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page_flutter/bloc/auth/auth_bloc.dart';
import 'package:login_page_flutter/bloc/auth/auth_state.dart';
import 'package:login_page_flutter/pages/internship_list_page.dart';
import 'package:login_page_flutter/pages/login_page.dart';

// Kullanıcının oturumunun kapanmasını dinleyip LoginPage'e yönlendirecek.
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.whenOrNull( // unauthenticated parametresini doğrudan kullandık
          unauthenticated: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const LoginPage()),
                  (Route<dynamic> route) => false,
            );
          },
        );
      },
      child: const InternshipListPage(),
    );
  }
}