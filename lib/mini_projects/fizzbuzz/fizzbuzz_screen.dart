import 'package:flutter/material.dart';

class FizzBuzzScreen extends StatefulWidget {
  const FizzBuzzScreen({super.key});

  @override
  State<FizzBuzzScreen> createState() => _FizzBuzzScreenState();
}

class _FizzBuzzScreenState extends State<FizzBuzzScreen> {
  final TextEditingController numberController = TextEditingController();
  String result = '';

  void generateFizzBuzz() {
    final int? number = int.tryParse(numberController.text);

    if (number == null || number <= 0) {
      setState(() {
        result = 'Please enter a valid positive number';
      });
      return;
    }

    List<String> output = [];

    for (int i = 1; i <= number; i++) {
      if (i % 3 == 0 && i % 5 == 0) {
        output.add('FizzBuzz');
      } else if (i % 3 == 0) {
        output.add('Fizz');
      } else if (i % 5 == 0) {
        output.add('Buzz');
      } else {
        output.add(i.toString());
      }
    }

    setState(() {
      result = output.join(', ');
    });
  }

  @override
  void dispose() {
    numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FizzBuzz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: numberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter a number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: generateFizzBuzz,
              child: const Text('Generate'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Text(result),
              ),
            ),
          ],
        ),
      ),
    );
  }
}