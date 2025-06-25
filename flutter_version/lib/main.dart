import 'package:flutter/material.dart';
import 'package:flutter_version/models/money.dart';
import 'package:flutter_version/screens/menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Budget budget = Budget();

    budget.addSpending(
      Transaction(
        amount: 12,
        date: DateTime(2025, 05, 1),
        description: "hh",
        isIncome: 0,
      ),
    );
    budget.addIncome(
      Transaction(
        amount: 100,
        date: DateTime(2025, 06, 1),
        description: "Salaire",
        isIncome: 1,
      ),
    );
    budget.addSpending(
      Transaction(
        amount: 20,
        date: DateTime(2025, 07, 1),
        description: "hh",
        isIncome: 0,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Menu(budget: budget),
    );
  }
}
