import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'utils/themes.dart';

import 'screens/home_screen_layout.dart';

import 'providers/create_project_provider.dart';
import 'providers/projects_list_provider.dart';
import 'providers/update_project_provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // wrapping the entire app with MultiProvider
    // multiple states are needed - Projects list, create project and update project
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
