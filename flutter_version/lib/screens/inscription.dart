import 'package:flutter/material.dart';

class Inscription extends StatelessWidget {
  const Inscription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Inscription")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Bienvenue dans la page d'inscription"),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Retour à l'accueil"),
            ),
          ],
        ),
      ),
    );
  }
}
