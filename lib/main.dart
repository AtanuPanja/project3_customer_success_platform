import 'package:flutter/material.dart';
import 'screens/home_screen_layout.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade200,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 0, 115, 234)),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 16.0,
              ),
            ),
            shape: MaterialStateProperty.all(
              BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(2.8),
              ),
            ),
          ),
        ),
        
      ),
      debugShowCheckedModeBanner: false,
      home: const SafeArea(child: HomeScreen()),
    );
  }
}


