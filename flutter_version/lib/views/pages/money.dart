import 'package:flutter/material.dart';
import 'package:flutter_version/data/classes/money.dart';
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

    return Stack(
      children: [
        Text(
          budget.calculBudget().toStringAsFixed(2) + " €",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: (() {}),
                  child: Icon(Icons.add),
                ),

                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: (() {}),
                  child: Icon(Icons.remove),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
