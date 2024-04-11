import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/projects_list_provider.dart';
import '../utils/constants/project_statuses.dart';
import '../widgets/projects_card.dart';
import '../widgets/project_listing.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({
    super.key,
  });

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<ProjectsListProvider>(context, listen: false);
    provider.getProjectsData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProjectsListProvider>(builder: (context, value, child) {
      final projects = value.projects;
      // developer.log(projects.toString(), name: 'Project Listing page projects');
      if (projects.isNotEmpty) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ProjectsCard(
                      count: projects.length.toString(),
                      type: 'All Projects',
                    ),
                    ProjectsCard(
                      count: projects
                          .where((element) =>
                              element.status == ProjectStatuses.onGoing)
                          .length
                          .toString(),
                      type: ProjectStatuses.onGoing,
                    ),
                    ProjectsCard(
                      count: projects
                          .where((element) =>
                              element.status == ProjectStatuses.completed)
                          .length
                          .toString(),
                      type: ProjectStatuses.completed,
                    ),
                    ProjectsCard(
                      count: projects
                          .where((element) =>
                              element.status == ProjectStatuses.hold)
                          .length
                          .toString(),
                      type: ProjectStatuses.hold,
                    ),
                  ],
                ),
              ),
              ProjectListing(
                listOfProjects: projects,
              ),
            ],
          ),
        );
      } else {
        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.article, size: 45,),
              Text(
                'No projects available',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      }
    });
  }
}
