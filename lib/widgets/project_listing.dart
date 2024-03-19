import 'package:flutter/material.dart';
import '../utils/colors.dart';
import 'projects_list_item.dart';

class ProjectListing extends StatefulWidget {
  const ProjectListing({
    super.key,
    required this.listOfProjects,
  });

  final List<Map<String, String>> listOfProjects;

  @override
  State<ProjectListing> createState() => _ProjectListingState();
}

class _ProjectListingState extends State<ProjectListing> {
  String selectedTab = 'All Projects';
  List<String> tabs = ['All Projects', 'In progress', 'Completed', 'Hold'];

  void setSelectedTab(String tabName) {
    setState(() {
      selectedTab = tabName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.dividerColor,
                ),
              ),
            ),
            child: Row(
              children: tabs.map<Widget>(
                (tabName) {
                  return InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: selectedTab == tabName
                                ? AppColors.primaryDarkBlue
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: Text(tabName),
                    ),
                    onTap: () {
                      setSelectedTab(tabName);
                    },
                  );
                },
              ).toList(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selectedTab,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              InkWell(
                child: const Row(
                  children: [
                    Icon(
                      Icons.arrow_upward,
                    ),
                    Icon(
                      Icons.arrow_downward,
                    ),
                  ],
                ),
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              ...switch (selectedTab) {
                'All Projects' => widget.listOfProjects,
                'In progress' => widget.listOfProjects
                    .where((project) => project['status'] == 'In progress'),
                'Completed' => widget.listOfProjects
                    .where((project) => project['status'] == 'Closed'),
                'Hold' => widget.listOfProjects
                    .where((project) => project['status'] == 'Hold'),
                _ => widget.listOfProjects,
              }
                  .map<ProjectsListItem>(
                (project) {
                  return ProjectsListItem(
                    allProjectsIsActive: selectedTab == 'All Projects',
                    name: project['name'] ?? 'project',
                    startDate: project['start_date'] ?? 'start_date',
                    status: project['status'] ?? 'No status',
                    projectManager:
                        project['project_manager'] ?? 'No project manager',
                    members: project['members'] ?? '0',
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
