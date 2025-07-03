import 'package:flutter/material.dart';
import 'package:flutter_version/data/notifiers.dart';
import 'package:flutter_version/views/pages/accueil.dart';
import 'package:flutter_version/views/pages/money.dart';
import 'package:flutter_version/views/pages/my_meal.dart';
import 'package:flutter_version/views/pages/settings.dart';
import 'package:flutter_version/views/pages/travel.dart';
import 'package:flutter_version/views/widget/navbar.dart';

List<Widget> pagesList = [Accueil(), Money(), MyMeal(), Travel()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Zen Life',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Settings()),
              );
            },
            icon: Icon(Icons.settings),
          ),
          IconButton(
            onPressed: () {
              isDarkModeNotifier.value = !isDarkModeNotifier.value;
            },
            icon: Icon(
              isDarkModeNotifier.value == true
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 95, 190, 187),
      ),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, value, child) {
          return pagesList.elementAt(value);
        },
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
