import 'package:flutter/material.dart';
import '../widgets/sort_button.dart';
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
  List<Map<String, String>> listOfProjects = [];
  String selectedTab = 'All Projects';
  List<String> tabs = ['All Projects', 'In progress', 'Completed', 'Hold'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listOfProjects = widget.listOfProjects;
  }

  void setSelectedTab(String tabName) {
    setState(() {
      selectedTab = tabName;
    });
  }

  void sortProjectsByMembers({bool descending = false}) {
    if (descending) {
      setState(() {
        listOfProjects.sort((a, b) {
          return int.parse(b['members']!) - int.parse(a['members']!);
        });
      });
    } else {
      setState(() {
        listOfProjects.sort((a, b) {
          return int.parse(a['members']!) - int.parse(b['members']!);
        });
      });
    }
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
              SortButton(
                sortAsc: () => sortProjectsByMembers(),
                sortDesc: () => sortProjectsByMembers(descending: true),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              ...switch (selectedTab) {
                'All Projects' => listOfProjects,
                'In progress' => listOfProjects
                    .where((project) => project['status'] == 'In progress'),
                'Completed' => listOfProjects
                    .where((project) => project['status'] == 'Closed'),
                'Hold' => listOfProjects
                    .where((project) => project['status'] == 'Hold'),
                _ => listOfProjects,
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
