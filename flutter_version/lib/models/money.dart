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

class Budget {
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
  }

  void addIncome(Transaction income) {
    transactions.add(income);
    sumIncome += income.amount;
  }

  void removeSpending(Transaction spending) {
    transactions.remove(spending);
    sumTransaction -= spending.amount;
  }

  void removeIncome(Transaction income) {
    transactions.remove(income);
    sumIncome -= income.amount;
  }

  void sortTransactionsByDate() {
    transactions.sort((a, b) => a.date.compareTo(b.date));
  }

  Widget displayBudget() {
    sortTransactionsByDate();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,

      children:
          transactions.map((transaction) {
            return ListTile(
              title: Text(
                transaction.description ?? "Transaction",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                "${transaction.date.toLocal()}".split(' ')[0],
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              trailing: Text(
                "${transaction.amount.toStringAsFixed(2)} €",
                style: TextStyle(
                  fontSize: 16,
                  color: transaction.isIncome == 1 ? Colors.green : Colors.red,
                ),
              ),
            );
          }).toList(),
    );
  }
}
