import 'package:flutter/material.dart';
import 'package:flutter_version/data/notifiers.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: "Accueil"),
            NavigationDestination(
              icon: Icon(Icons.checklist),
              label: "To-Do List",
            ),
            NavigationDestination(icon: Icon(Icons.money), label: "Money"),
            NavigationDestination(icon: Icon(Icons.restaurant), label: "Repas"),
            NavigationDestination(
              icon: Icon(Icons.travel_explore),
              label: "Voyage",
            ),
          ],
          onDestinationSelected: (value) {
            selectedPageNotifier.value = value;
          },
          selectedIndex: selectedPage,
        );
      },
    );
  }
}
