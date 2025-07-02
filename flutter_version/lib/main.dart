import 'package:flutter/material.dart';
import 'package:flutter_version/data/classes/money.dart';
import 'package:flutter_version/views/pages/widget_tree.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Budget(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.white,

            brightness: Brightness.light,
          ),
        ),
        home: WidgetTree(),
      ),
    );
  }
}
