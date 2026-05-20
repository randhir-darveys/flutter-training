import 'package:flutter/material.dart';
import '../mini_projects/fizzbuzz/fizzbuzz_screen.dart';
import '../mini_projects/bank_account/bank_account_screen.dart';
import '../mini_projects/mock_json/mock_json_screen.dart';
import '../mini_projects/hello_world/hello_world_screen.dart';
import '../mini_projects/profile_card/profile_card_screen.dart';
import '../mini_projects/auth_flow/screens/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<String> projects = const [
    'FizzBuzz with User Input',
    'Bank Account OOP',
    'Mock JSON Filter & Sort',
    'Hello World Theme',
    'Profile Card UI',
    'Login & Signup Flow',
  ];

  void openProject(BuildContext context, int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const FizzBuzzScreen(),
        ),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const BankAccountScreen(),
        ),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MockJsonScreen(),
        ),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HelloWorldScreen(),
        ),
      );
    } else if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ProfileCardScreen(),
        ),
      );
    } else if (index == 5) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Mini Projects'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              onTap: () => openProject(context, index),
              leading: CircleAvatar(
                child: Text('${index + 1}'),
              ),
              title: Text(projects[index]),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          );
        },
      ),
    );
  }
}