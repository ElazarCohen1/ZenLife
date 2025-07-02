import 'package:flutter/material.dart';

class Travel extends StatelessWidget {
  const Travel({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Bienvenue dans la page Travel"),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Retour à l'accueil"),
          ),
        ],
      ),
    );
  }
}
