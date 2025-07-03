import 'package:flutter/material.dart';
import 'package:flutter_version/data/notifiers.dart';
import 'package:flutter_version/views/pages/accueil.dart';
import 'package:flutter_version/views/pages/money.dart';
import 'package:flutter_version/views/pages/my_meal.dart';
import 'package:flutter_version/views/pages/settings.dart';
import 'package:flutter_version/views/pages/to_do_list_page.dart';
import 'package:flutter_version/views/pages/travel.dart';
import 'package:flutter_version/views/widget/navbar.dart';

List<Widget> pagesList = [Accueil(), ToDoList(), Money(), MyMeal(), Travel()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF1A0B2E), // violet très foncé
                  Color(0xFF6A0DAD), // violet classique
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
          ),
        ),
        title: const Text(
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
            icon: const Icon(Icons.settings, color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              isDarkModeNotifier.value = !isDarkModeNotifier.value;
            },
            icon: Icon(
              isDarkModeNotifier.value == true
                  ? Icons.dark_mode
                  : Icons.light_mode,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, value, child) {
          print(
            "Selected index: $value" + pagesList.elementAt(value).toString(),
          );
          return pagesList.elementAt(value);
        },
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
