import 'package:flutter/material.dart';
import 'package:project3_customer_success_platform/screens/project_detail_screen.dart';

class ProjectsCardDisplay extends StatelessWidget {
  const ProjectsCardDisplay({
    super.key,
    required this.count,
    required this.type,
  });

  final String count;
  final String type;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth / 5,
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 16.0,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 24.0,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade700,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Text(
            count,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            type,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

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
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8.0),
                    ),
                    color: switch (status) {
                      'On going' || 'In progress' => Colors.green,
                      'Closed' => Colors.red,
                      'Hold' => Colors.black,
                      _ => Colors.transparent,
                    },
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              tileColor: Colors.white,
              leading: Icon(Icons.article_outlined),
              title: Text(name),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(startDate),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Project Manager: ',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(text: projectManager),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      margin: EdgeInsets.only(top: 8.0),
                      padding: EdgeInsets.all(8.0),
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
  List<String> tableHeaders = [
    'Project Name',
    'Started on',
    'Status',
    'Project Manager',
    'Members'
  ];

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
                  color: Colors.grey.shade500,
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
                                ? const Color.fromARGB(255, 0, 115, 234)
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
