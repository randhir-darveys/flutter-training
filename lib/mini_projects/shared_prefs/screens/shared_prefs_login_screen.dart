import 'package:flutter/material.dart';
import '../services/shared_prefs_service.dart';
import 'shared_prefs_home_screen.dart';

class SharedPrefsLoginScreen extends StatefulWidget {
  const SharedPrefsLoginScreen({super.key});

  @override
  State<SharedPrefsLoginScreen> createState() =>
      _SharedPrefsLoginScreenState();
}

class _SharedPrefsLoginScreenState extends State<SharedPrefsLoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final SharedPrefsService prefsService = SharedPrefsService();

  void login() async {
    if (emailController.text.isEmpty) {
      return;
    }

    await prefsService.saveLogin(emailController.text);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SharedPrefsHomeScreen(
          email: emailController.text,
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SharedPreferences Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Enter Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: login,
              child: const Text('Login & Save'),
            ),
          ],
        ),
      ),
    );
  }
}