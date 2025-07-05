import 'package:flutter/material.dart';
import 'package:flutter_version/views/pages/connexion.dart';
import 'package:flutter_version/views/pages/inscription.dart';
import 'package:flutter_version/views/pages/widget_tree.dart';
import 'package:flutter_version/views/widget/customPaint.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Arrière-plan avec CustomPaint
          CustomPaint(painter: BackgroundPainter(), size: Size.infinite),

          // Contenu principal
          Column(
            children: [
              // Espace flexible pour centrer le Lottie
              Expanded(
                child: Center(
                  child: Lottie.asset(
                    "assets/lotties/welcome.json",
                    width: 300,
                    height: 300,
                  ),
                ),
              ),

              // Bouton en bas avec marge
              Container(
                margin: const EdgeInsets.only(
                  bottom: 40,
                ), // Marge autour du conteneur
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(
                          Colors.blue,
                        ),
                        foregroundColor: WidgetStateProperty.all<Color>(
                          Colors.white,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Connexion()),
                        );
                      },
                      child: const Text('Connexion'),
                    ),
                    const SizedBox(height: 20), // Espace entre les boutons
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Inscription(),
                          ),
                        );
                      },
                      child: Text('inscription'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
