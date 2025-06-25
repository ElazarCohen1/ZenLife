import 'package:flutter/material.dart';
import 'package:flutter_version/screens/connexion.dart';
import 'package:flutter_version/screens/inscription.dart';

class Accueil extends StatelessWidget {
  const Accueil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.end,

        children: [
          const SizedBox(width: 20),
          ElevatedButton(
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Connexion()),
                ),
            child: const Text("Connexion"),
          ),
          ElevatedButton(
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Inscription()),
                ),
            child: const Text("Inscription"),
          ),
        ],
      ),
    );
  }
}
