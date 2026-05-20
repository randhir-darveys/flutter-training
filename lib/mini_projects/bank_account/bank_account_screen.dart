import 'package:flutter/material.dart';
import 'models/bank_account.dart';

class BankAccountScreen extends StatefulWidget {
  const BankAccountScreen({super.key});

  @override
  State<BankAccountScreen> createState() => _BankAccountScreenState();
}

class _BankAccountScreenState extends State<BankAccountScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  BankAccount? account;
  String message = '';

  void createAccount() {
    if (nameController.text.isNotEmpty) {
      setState(() {
        account = BankAccount(
          accountHolderName: nameController.text,
          balance: 0,
        );
        message = 'Account created successfully';
      });
    }
  }

  void depositMoney() {
    final double? amount = double.tryParse(amountController.text);

    if (account != null && amount != null) {
      setState(() {
        account!.deposit(amount);
        message = '₹$amount deposited';
      });
    }
  }

  void withdrawMoney() {
    final double? amount = double.tryParse(amountController.text);

    if (account != null && amount != null) {
      final success = account!.withdraw(amount);

      setState(() {
        message = success
            ? '₹$amount withdrawn'
            : 'Insufficient balance';
      });
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bank Account OOP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Account Holder Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: createAccount,
              child: const Text('Create Account'),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter Amount',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: depositMoney,
                    child: const Text('Deposit'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: withdrawMoney,
                    child: const Text('Withdraw'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            if (account != null) ...[
              Text(
                'Account Holder: ${account!.accountHolderName}',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                'Balance: ₹${account!.balance}',
                style: const TextStyle(fontSize: 18),
              ),
            ],

            const SizedBox(height: 20),

            Text(
              message,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}