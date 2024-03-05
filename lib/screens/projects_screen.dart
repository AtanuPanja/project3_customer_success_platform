import 'package:flutter/material.dart';
import '../widgets/projects_screen_widgets.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ProjectsCardDisplay(
                  count: '41',
                  type: 'All Projects',
                ),
                ProjectsCardDisplay(
                  count: '24',
                  type: 'In Progress',
                ),
                ProjectsCardDisplay(
                  count: '12',
                  type: 'Completed',
                ),
                ProjectsCardDisplay(
                  count: '5',
                  type: 'Hold',
                ),
              ],
            ),
          ),

          ProjectListing(),
        ],
      ),
    );
  }
}