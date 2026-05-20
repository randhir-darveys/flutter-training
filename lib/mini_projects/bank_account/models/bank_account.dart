class BankAccount {
  String accountHolderName;
  double balance;

  BankAccount({
    required this.accountHolderName,
    required this.balance,
  });

  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
    }
  }

  bool withdraw(double amount) {
    if (amount > 0 && amount <= balance) {
      balance -= amount;
      return true;
    }
    return false;
  }
}