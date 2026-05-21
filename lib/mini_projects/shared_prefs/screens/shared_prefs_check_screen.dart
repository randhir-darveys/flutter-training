import 'package:flutter/material.dart';
import '../services/shared_prefs_service.dart';
import 'shared_prefs_home_screen.dart';
import 'shared_prefs_login_screen.dart';

class SharedPrefsCheckScreen extends StatelessWidget {
  const SharedPrefsCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SharedPrefsService prefsService = SharedPrefsService();

    return FutureBuilder<bool>(
      future: prefsService.getLoginStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        final bool isLoggedIn = snapshot.data ?? false;

        if (isLoggedIn) {
          return FutureBuilder<String>(
            future: prefsService.getEmail(),
            builder: (context, emailSnapshot) {
              if (emailSnapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              return SharedPrefsHomeScreen(
                email: emailSnapshot.data ?? '',
              );
            },
          );
        }

        return const SharedPrefsLoginScreen();
      },
    );
  }
}