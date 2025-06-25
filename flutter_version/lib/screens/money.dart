import 'package:flutter/material.dart';
import 'package:flutter_version/models/money.dart';
import 'package:flutter_version/screens/mainscaffold.dart';

class Money extends StatelessWidget {
  final Budget budget;
  const Money({super.key, required this.budget});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            // le solde disponible
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFE0F7F4), // Vert-bleu pastel doux
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Solde disponible",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      // Calcul du budget et l'affichec
                      "${budget.calculBudget().toStringAsFixed(2)} €",
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF004D40), // Vert foncé élégant
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFFE0F7F4), // Vert-bleu pastel doux
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Historique des dépenses et revenus",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withValues(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    budget.displayBudget(),
                    // Affichage des dépenses par date
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
