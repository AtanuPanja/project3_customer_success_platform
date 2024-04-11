import 'package:flutter/material.dart';
import 'package:project3_customer_success_platform/providers/managers_list_provider.dart';
import 'package:project3_customer_success_platform/providers/projects_list_provider.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen_layout.dart';
import 'utils/themes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // wrapping the entire app with ChangeNotifierProvider
    // single state - ProjectsList is required now, this is why ChangeNotifierProvider is used
    return ChangeNotifierProvider(
      create: (context) => ProjectsListProvider(),
      child: MaterialApp(
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        debugShowCheckedModeBanner: false,
        home: const SafeArea(child: HomeScreen()),
      ),
    );
  }
}

/*
commit message:
Use ChangeNotifierProvider

Wrap MaterialApp with ChangeNotifierProvider
to provide the state to all the children
in the widget tree

This acts as a global state
Currently only a single state i.e. ProjectsList
is required so use the ChangeNotifierProvider
 */