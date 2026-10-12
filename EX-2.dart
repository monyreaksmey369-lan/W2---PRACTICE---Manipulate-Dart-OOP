import 'dart:math';

class BankAccount {
  // TODO
  // Q1. Attribute.
  final int accountId;
  final String accountOwner;
  double _balance = 0;

  // Constructor
  BankAccount({required this.accountId, required this.accountOwner});

  // Q2 : Get current balance;
  double get balance => _balance;
  // add money
  void credit(double amount) {
    if (amount <= 0) {
      throw Exception('Amount must be greater than zero!');
    }
    _balance += amount;
  }

  // Q2: withdraw money
  void withdraw(double amount) {
    if (amount <= 0) {
      throw Exception('Amount must be greater than zero!');
    }
    if (_balance - amount < 0) {
      throw Exception('Your withdrawal was succesful');
    }
    _balance -= amount;
  }
}

class Bank {
  // TODO
  // Q3. Attributes.
  final String name;
  final List<BankAccount> _accounts = [];

  Bank({required this.name});

  //Q4. create an account
  BankAccount createAccount(int accountId, String accountOwner) {
    for (var i in _accounts) {
      if (i.accountId == accountId) {
        throw Exception('Account with ID $accountId already exites!');
      }
    }
    final newAccount = BankAccount(
      accountId: accountId,
      accountOwner: accountOwner,
    );
    _accounts.add(newAccount);
    return newAccount;
  }
}

void main() {
  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
