import 'package:flutter/material.dart';

class AddPayement extends StatelessWidget {
  const AddPayement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Payment")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Bienvenue dans la page Add Payment"),
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
