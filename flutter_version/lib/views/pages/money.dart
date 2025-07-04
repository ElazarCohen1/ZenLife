import 'package:flutter/material.dart';
import 'package:flutter_version/data/classes/money.dart';
import 'package:flutter_version/views/pages/add_payement.dart';
import 'package:flutter_version/views/widget/customPaint.dart';
import 'package:provider/provider.dart';

class Money extends StatefulWidget {
  const Money({super.key});

  @override
  State<Money> createState() => _MoneyState();
}

class _MoneyState extends State<Money> {
  @override
  Widget build(BuildContext context) {
    final budget = Provider.of<Budget>(context);
    final double total = budget.calculBudget();
    return Scaffold(
      appBar: AppBar(title: const Text("Mes Transactions"), centerTitle: true),
      body: SafeArea(
        child: CustomPaint(
          painter: BackgroundPainter(),
          size: Size.infinite,
          child: Column(
            children: [
              const SizedBox(height: 10),
              Expanded(
                child:
                    budget.transactions.isEmpty
                        ? const Center(
                          child: Text("Aucune transaction enregistrée."),
                        )
                        : ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          itemCount: budget.transactions.length,
                          itemBuilder: (context, index) {
                            final transaction = budget.transactions[index];
                            final isIncome = transaction.isIncome == true;
                            final icon =
                                isIncome
                                    ? Icons.arrow_upward
                                    : Icons.arrow_downward;
                            final iconColor =
                                isIncome == true ? Colors.green : Colors.red;

                            return Card(
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: iconColor.withValues(
                                    alpha: 0.2,
                                  ),
                                  child: Icon(icon, color: iconColor),
                                ),
                                title: Text(
                                  transaction.description ??
                                      "Aucune description",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                subtitle: Text(
                                  "${transaction.date.day}/${transaction.date.month}/${transaction.date.year}",
                                  style: const TextStyle(fontSize: 13),
                                ),
                                trailing: Wrap(
                                  spacing: 5,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Text(
                                      "${isIncome ? '+' : '-'}${transaction.amount.toStringAsFixed(2)} €",
                                      style: TextStyle(
                                        color: iconColor,
                                        fontSize: 15,
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete_outline),
                                      color: Colors.grey,
                                      onPressed: () {
                                        if (isIncome) {
                                          budget.removeIncome(transaction);
                                        } else {
                                          budget.removeSpending(transaction);
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.all(10),
                alignment: Alignment.topCenter,

                height: 150,
                child: Text(
                  "Solde actuel : ${total.toStringAsFixed(2)} €",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: total < 0 ? Colors.red : Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddPayement()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
