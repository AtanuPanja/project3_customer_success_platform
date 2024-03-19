import 'package:flutter/material.dart';
import 'screens/home_screen_layout.dart';
import 'utils/themes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const SafeArea(child: HomeScreen()),
    );
  }
}
