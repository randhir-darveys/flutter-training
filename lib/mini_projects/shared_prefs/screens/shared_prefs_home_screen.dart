import 'package:flutter/material.dart';
import '../services/shared_prefs_service.dart';
import 'shared_prefs_login_screen.dart';

class SharedPrefsHomeScreen extends StatelessWidget {
  final String email;

  const SharedPrefsHomeScreen({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    final SharedPrefsService prefsService = SharedPrefsService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('SharedPrefs Home'),
      ),
      body: Center(
        child: Container(
          width: 320,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 12,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Welcome, $email',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await prefsService.logout();

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SharedPrefsLoginScreen(),
                    ),
                  );
                },
                child: const Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Explanation:

// SharedPreferences = local key-value storage
// Data app close hone ke baad bhi saved rehta hai
// logout = saved keys remove