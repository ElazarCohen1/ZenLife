import 'package:flutter/material.dart';

class Accueil extends StatelessWidget {
  const Accueil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(3, (context) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("bonjour", style: TextStyle(fontSize: 18)),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
