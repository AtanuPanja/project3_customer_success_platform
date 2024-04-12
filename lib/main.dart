import 'package:flutter/material.dart';
import 'package:project3_customer_success_platform/providers/create_project_provider.dart';
import 'package:project3_customer_success_platform/providers/projects_list_provider.dart';
import 'package:project3_customer_success_platform/providers/update_project_provider.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProjectsListProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CreateProjectProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UpdateProjectProvider(),
        ),
      ],
      child: MaterialApp(
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        debugShowCheckedModeBanner: false,
        home: const SafeArea(child: HomeScreen()),
      ),
    );
  }
}
