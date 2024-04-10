import 'package:flutter/material.dart';

import 'package:project3_customer_success_platform/screens/project_detail_screen.dart';
import 'package:project3_customer_success_platform/utils/constants/project_statuses.dart';

import '../utils/colors.dart';

class ProjectsListItem extends StatelessWidget {
  const ProjectsListItem({
    super.key,
    required this.allProjectsIsActive,
    required this.name,
    required this.startDate,
    required this.status,
    required this.projectManager,
    required this.members,
  });
  final bool allProjectsIsActive;
  final String name;
  final String startDate;
  final String status;
  final String projectManager;
  final String members;

  @override
  Widget build(BuildContext context) {
    bool darkModeIsActive =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProjectDetailsScreen(
                projectName: name,
                members: members,
              ),
            ),
          );
        },
        child: Stack(
          children: [
            if (allProjectsIsActive)
              Positioned(
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(8.0),
                    ),
                    color: switch (status) {
                      ProjectStatuses.onGoing =>
                        AppColors.ongoingProjectColor,
                      ProjectStatuses.completed => AppColors.closedProjectColor,
                      ProjectStatuses.hold => AppColors.holdProjectColor,
                      _ => Colors.transparent,
                    },
                  ),
                  child: Text(
                    status,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              tileColor: darkModeIsActive
                  ? AppColors.listTileDarkColor
                  : AppColors.listTileColor,
              leading: const Icon(Icons.article_outlined),
              title: Text(name),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(startDate),
                    Text(
                      "Project Manager: $projectManager",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: darkModeIsActive
                            ? AppColors.cardBorderColor
                            : AppColors.appBgColor,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      margin: const EdgeInsets.only(top: 8.0),
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        switch (members) {
                          '0' => 'No members',
                          '1' => '1 member',
                          _ => "$members members",
                        },
                      ),
                    ),
                  ],
                ),
              ),
              isThreeLine: true,
            ),
          ],
        ),
      ),
    );
  }
}
