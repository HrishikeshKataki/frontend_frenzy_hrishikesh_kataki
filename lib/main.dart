import 'package:flutter/material.dart';
import 'package:frontend_frenzy/pages/landing_page.dart';
import 'package:frontend_frenzy/utils/my_colors.dart';
import 'package:frontend_frenzy/widgets/bottom_navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
          primaryColor: primary,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme:
              const AppBarTheme(titleTextStyle: TextStyle(color: white))),
      home: const Home(),
    );
  }
}
