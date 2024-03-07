import 'package:flutter/material.dart';
import '../widgets/projects_screen_widgets.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({
    super.key,
    required this.listOfProjects,
  });
  final List<Map<String, String>> listOfProjects;

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SingleChildScrollView(
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
          ProjectListing(
            listOfProjects: widget.listOfProjects,
          ),
        ],
      ),
    );
  }
}
