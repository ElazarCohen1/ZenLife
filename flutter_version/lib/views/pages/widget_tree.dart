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
        title: Text('Zen Life'),
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
        ],
        backgroundColor: const Color.fromARGB(255, 11, 224, 217),
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
