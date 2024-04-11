import 'package:flutter/material.dart';
// import 'package:project3_customer_success_platform/data/list_of_projects.dart';
// import 'dart:developer' as developer;
import 'package:project3_customer_success_platform/utils/constants/project_statuses.dart';
import '../model/project.dart';
// import '../widgets/sort_button.dart';
import '../utils/colors.dart';
import 'projects_list_item.dart';

class ProjectListing extends StatefulWidget {
  const ProjectListing({
    super.key,
    required this.listOfProjects,
  });

  final List<Project> listOfProjects;

  @override
  State<ProjectListing> createState() => _ProjectListingState();
}

class _ProjectListingState extends State<ProjectListing> {
  // variable to hold the list of project in the current state
  // List<Project> listOfProjects = [];
  // managing the state for the selected tab amongst the tabs
  String selectedTab = 'All Projects';
  // all tabs as shown as categories in the table
  List<String> tabs = ['All Projects', ProjectStatuses.onGoing, ProjectStatuses.completed, ProjectStatuses.hold];

  @override
  void initState() {
    super.initState();
    // listOfProjects = widget.listOfProjects;
  }

  void setSelectedTab(String tabName) {
    setState(() {
      selectedTab = tabName;
    });
  }

  // // sorting based on the members - ascending or descending
  // void sortProjectsByMembers({bool descending = false}) {
  //   if (descending) {
  //     setState(() {
  //       listOfProjects.sort((a, b) {
  //         return int.parse(b['members']!) - int.parse(a['members']!);
  //       });
  //     });
  //   } else {
  //     setState(() {
  //       listOfProjects.sort((a, b) {
  //         return int.parse(a['members']!) - int.parse(b['members']!);
  //       });
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // consume the state from the ProjectsListProvider to build the ui
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
              // SortButton(
              //   sortAsc: () => sortProjectsByMembers(),
              //   sortDesc: () => sortProjectsByMembers(descending: true),
              // ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              // filtering based on the tab name
              ...switch (selectedTab) {
                'All Projects' => widget.listOfProjects,
                
                _ => widget.listOfProjects.where((project) => project.status == selectedTab),
              }
                  .map<ProjectsListItem>(
                (project) {
                  return ProjectsListItem(
                    allProjectsIsActive: selectedTab == 'All Projects',
                    name: project.name,
                    startDate: project.startDate,
                    status: project.status,
                    projectManager:
                        project.associatedManager.name,
                    members: project.members.toString(),
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
