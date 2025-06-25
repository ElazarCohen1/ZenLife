import 'package:flutter/material.dart';

class MyMeal extends StatelessWidget {
  const MyMeal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Meal")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Bienvenue dans la page My Meal"),
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
