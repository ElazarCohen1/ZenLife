import 'package:flutter/material.dart';
import 'package:flutter_version/data/classes/money.dart';
import 'package:flutter_version/data/constants.dart';
import 'package:flutter_version/data/notifiers.dart';
import 'package:flutter_version/views/pages/welcome_page.dart';
import 'package:flutter_version/views/pages/widget_tree.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    initDarkMode();
    super.initState();
  }

  void initDarkMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? isDarkMode = prefs.getBool(Kconstant.darkMode);
    if (isDarkMode != null) {
      isDarkModeNotifier.value = isDarkMode;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDark, child) {
        return ChangeNotifierProvider(
          create: (context) => Budget(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.white,

                brightness: isDark ? Brightness.dark : Brightness.light,
              ),
            ),
            home: WelcomePage(),
          ),
        );
      },
    );
  }
}
