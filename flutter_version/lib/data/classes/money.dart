import 'package:flutter/material.dart';

class Transaction {
  final double amount;
  final DateTime date;
  final String? description;
  final int? isIncome; // 0 for spending, 1 for income

  Transaction({
    required this.amount,
    required this.date,
    this.description,
    required,
    this.isIncome,
  });
}

class Budget extends ChangeNotifier {
  List<Transaction> transactions = [];
  double sumTransaction = 0.0;
  double sumIncome = 0.0;
  Budget();

  double calculBudget() {
    return sumIncome - sumTransaction;
  }

  void addSpending(Transaction spending) {
    transactions.add(spending);
    sumTransaction += spending.amount;
    notifyListeners();
  }

  void addIncome(Transaction income) {
    transactions.add(income);
    sumIncome += income.amount;
    notifyListeners();
  }

  void removeSpending(Transaction spending) {
    transactions.remove(spending);
    sumTransaction -= spending.amount;
    notifyListeners();
  }

  void removeIncome(Transaction income) {
    transactions.remove(income);
    sumIncome -= income.amount;
    notifyListeners();
  }

  void sortTransactionsByDate() {
    transactions.sort((a, b) => a.date.compareTo(b.date));
    notifyListeners();
  }
}
