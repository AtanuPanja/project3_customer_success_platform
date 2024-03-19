import 'package:flutter/material.dart';
import '../widgets/projects_card.dart';
import '../widgets/project_listing.dart';

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
                ProjectsCard(
                  count: '41',
                  type: 'All Projects',
                ),
                ProjectsCard(
                  count: '24',
                  type: 'In Progress',
                ),
                ProjectsCard(
                  count: '12',
                  type: 'Completed',
                ),
                ProjectsCard(
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
