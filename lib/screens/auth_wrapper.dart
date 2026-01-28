import 'package:flutter/material.dart';
import '../core/utils/token_storage.dart';
import '../features/login/login_page.dart';
import 'main_wrapper.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  Future<bool> _hasToken() async {
    final token = await TokenStorage.getToken();
    return token != null && token.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _hasToken(),
      builder: (context, snapshot) {
        // Loading saat cek token
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        // Jika token ada → langsung MainWrapper
        if (snapshot.data == true) {
          return const MainWrapper();
        }

        // Jika tidak ada token → Login
        return const LoginPage();
      },
    );
  }
}
