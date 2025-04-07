void main() {
  // Create a regular bank account
  BankAccount account1 = BankAccount('5193', 'S. M. Mustazir Billah', 1000.0);
  account1.deposit(500);
  account1.withdraw(200);
  print(account1);

  print('---------------------------');

  // Create a savings account (Polymorphism in action)
  BankAccount account2 = SavingsAccount('789012', 'Billah', 2000.0, 0.05);
  account2.deposit(1000);
  account2.withdraw(500);

  // Apply interest (type-safe downcast, no unnecessary cast)
  if (account2 is SavingsAccount) {
    account2.applyInterest(); // no cast needed!
  }

  print(account2);
}

/// Base class demonstrating encapsulation
class BankAccount {
  // Private and final attributes
  final String _accountNumber;
  final String _accountHolderName;
  double _balance;

  // Constructor
  BankAccount(this._accountNumber, this._accountHolderName, this._balance);

  // Getters
  String get accountNumber => _accountNumber;
  String get accountHolderName => _accountHolderName;
  double get balance => _balance;

  // Deposit method
  void deposit(double amount) {
    if (amount <= 0) {
      print('Deposit amount must be positive.');
      return;
    }
    _balance += amount;
    print('Deposited \$${amount.toStringAsFixed(2)} to $_accountHolderName\'s account.');
  }

  // Withdraw method
  void withdraw(double amount) {
    if (amount <= 0) {
      print('Withdrawal amount must be positive.');
      return;
    }
    if (_balance - amount < 0) {
      print('Insufficient funds for withdrawal.');
      return;
    }
    _balance -= amount;
    print('Withdrew \$${amount.toStringAsFixed(2)} from $_accountHolderName\'s account.');
  }

  // toString() method
  @override
  String toString() =>
      'Account Number: $_accountNumber\nAccount Holder: $_accountHolderName\nBalance: \$${_balance.toStringAsFixed(2)}';
}

/// SavingsAccount class extending BankAccount (inheritance)
class SavingsAccount extends BankAccount {
  final double _interestRate;

  // Using super parameters
  SavingsAccount(super.accountNumber, super.accountHolderName, super.balance, this._interestRate);

  // Apply interest
  void applyInterest() {
    double interest = balance * _interestRate;
    deposit(interest);
    print('Interest of \$${interest.toStringAsFixed(2)} applied at rate ${(_interestRate * 100).toStringAsFixed(2)}%.');
  }

  // Polymorphism: Override toString()
  @override
  String toString() =>
      '${super.toString()}\nAccount Type: Savings\nInterest Rate: ${(_interestRate * 100).toStringAsFixed(2)}%';
}
