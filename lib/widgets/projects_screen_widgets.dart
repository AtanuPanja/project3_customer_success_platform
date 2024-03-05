import 'package:flutter/material.dart';

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
      width: screenWidth / 1.6,
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0,),
      padding: const EdgeInsets.symmetric(
        vertical: 40.0,
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
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            type,
          ),
        ],
      ),
    );
  }
}


class ProjectListing extends StatefulWidget {
  const ProjectListing({super.key});

  @override
  State<ProjectListing> createState() => _ProjectListingState();
}

class _ProjectListingState extends State<ProjectListing> {

  var listOfProjects = [
    {
      'name': 'Food on time',
      'start_date': '12 Feb 24',
      'status': 'On going',
      'project_manager': 'Dipa Majumdar',
      'members': '6'
    },
    {
      'name': '2023-01-01',
      'start_date': '1 Jan 24',
      'status': 'Closed',
      'project_manager': 'Dipa Majumdar',
      'members': '12'
    },
    {
      'name': '2023-01-01',
      'start_date': 'Placeholder for start date',
      'status': 'In progress',
      'project_manager': 'Dipa Majumdar',
      'members': '14'
    },
    {
      'name': '2023-01-01',
      'start_date': 'Placeholder for start date',
      'status': 'In progress',
      'project_manager': 'Dipa Majumdar',
      'members': '4'
    },
    {
      'name': '2023-01-01',
      'start_date': 'Placeholder for start date',
      'status': 'In progress',
      'project_manager': 'Rohit Shah',
      'members': '30'
    },
    {
      'name': '2023-01-01',
      'start_date': 'Placeholder for start date',
      'status': 'Hold',
      'project_manager': 'Rohit Shah',
      'members': '20'
    },
    {
      'name': '2023-01-01',
      'start_date': 'Placeholder for start date',
      'status': 'In progress',
      'project_manager': 'Rohit Shah',
      'members': '13'
    },
    {
      'name': '2023-01-01',
      'start_date': 'Placeholder for start date',
      'status': 'In progress',
      'project_manager': 'Rohit Shah',
      'members': '9'
    },
    {
      'name': '2023-01-01',
      'start_date': 'Placeholder for start date',
      'status': 'Closed',
      'project_manager': 'Rohit Shah',
      'members': '100'
    },
    {
      'name': '2023-01-01',
      'start_date': 'Placeholder for start date',
      'status': 'Closed',
      'project_manager': 'Rohit Shah',
      'members': '100'
    },
    {
      'name': '2023-01-01',
      'start_date': 'Placeholder for start date',
      'status': 'Closed',
      'project_manager': 'Rohit Shah',
      'members': '100'
    },

  ];

  String selectedTab = 'All Projects';
  List<String> tabs = ['All Projects', 'In progress', 'Completed', 'Hold'];
  List<String> tableHeaders = ['Project Name', 'Started on', 'Status', 'Project Manager', 'Members'];
  // List<bool> tabSelected = [true, false, false, false];

  // void updateTabs(int currentIndex) {
  //   setState(() {
  //     // for (var i = 0; i < tabSelected.length; i++) {
  //     //   tabSelected[i] = false;
  //     // }
  //     // tabSelected[currentIndex] = true;
  //   });
  // }

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
          Row(
            children: tabs.map<Widget>((tabName) {
              return InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: selectedTab == tabName ? const Color.fromARGB(255, 0, 115, 234): Colors.transparent,
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
            },).toList(),
          ),
      
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selectedTab,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              InkWell(
                child: Row(
                  children: [
                    Icon(Icons.arrow_upward,),
                    Icon(Icons.arrow_downward,),
                  ],
                ),
                onTap: () {},
              ),
            ],
          ),
          SizedBox(height: 10,),
          Table(
            children: [
              TableRow(
                children: tableHeaders.map<Widget>((tableHeader) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      tableHeader,
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                },).toList(),
              ),
              
              ...switch (selectedTab) {
                'All Projects' => listOfProjects,
                'In progress' => listOfProjects.where((project) => project['status'] == 'In progress'),
                'Completed' => listOfProjects.where((project) => project['status'] == 'Closed'),
                'Hold' => listOfProjects.where((project) => project['status'] == 'Hold'),
                _ => listOfProjects,
              }.map<TableRow>((project) {
                return TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        '${project['name']}'
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        '${project['start_date']}'
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
                      decoration: BoxDecoration(
                        color: switch (project['status']) {
                          'On going' || 'In progress' => Color.fromARGB(255, 49, 135, 80),
                          'Closed' => Color.fromARGB(255, 216, 58, 82),
                          'Hold' => Colors.black,
                          _ => Colors.transparent,
                        },
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Text(
                        '${project['status']}',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        '${project['project_manager']}'
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        '${project['members']}'
                      ),
                    ),
                  ],
                );
              },).toList()
            ],
          ),
        ],
      ),
    );
  }
}