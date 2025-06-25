import 'package:flutter/material.dart';
import 'package:flutter_version/models/money.dart';
import 'package:flutter_version/screens/accueil.dart';
import 'package:flutter_version/screens/my_meal.dart';
import 'package:flutter_version/screens/money.dart';
import 'package:flutter_version/screens/settings.dart';
import 'package:flutter_version/screens/travel.dart';

class Menu extends StatefulWidget {
  // the title of the page
  final Budget budget;
  const Menu({super.key, required this.budget});

  static const Color c = Color.fromARGB(219, 242, 237, 237);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  // List of children widgets for the menu
  late List<Widget> children;

  @override
  void initState() {
    super.initState();
    children = [
      const Accueil(),
      Money(budget: widget.budget),
      const MyMeal(),
      const Travel(),
      const Settings(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  int currentIndex = 0;
  // Default index for the selected item
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          children[currentIndex], // Display the current page based on the index

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 121, 63, 119),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        onTap: _onItemTapped,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Menu.c),
            label: "Accueil",
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.login, color: Menu.c),
          //   label: "Connexion",
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money, color: Menu.c),
            label: "Money",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal, color: Menu.c),
            label: "my Meal",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flight, color: Menu.c),
            label: "travel",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Menu.c),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
