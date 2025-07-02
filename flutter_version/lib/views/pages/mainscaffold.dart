import 'package:flutter/material.dart';
import 'package:flutter_version/views/widget/navbar.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({super.key, required this.body, required this.title});

  final Widget body;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      bottomNavigationBar: NavBar(),
      body: body,
    );
  }
}
