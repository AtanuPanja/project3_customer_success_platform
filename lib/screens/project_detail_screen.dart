import 'package:flutter/material.dart';

class ProjectDetailsScreen extends StatefulWidget {
  const ProjectDetailsScreen({
    super.key,
    required this.projectName,
    required this.members,
  });

  final String projectName;
  final String members;

  @override
  State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  String currentTab = 'Project Overview';
  List<String> tabs = [
    'Project Overview',
    'Scope & stack',
    'Escalation matrix',
  ];

  void setCurrentTab(String tabName) {
    setState(() {
      currentTab = tabName;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var currentOrientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Breadcrumbs: This Row widget creates the breadcrumbs display
              // Clicking on the Projects, we can again navigate back to the projects page
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Row(
                      children: [
                        Icon(
                          Icons.card_travel_rounded,
                          size: 12,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          'Projects',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.business_center_outlined,
                        size: 12,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        widget.projectName,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 12,
                      ),
                    ],
                  ),
                ],
              ),
              // breadcrumbs widget ends here
              const SizedBox(
                height: 10,
              ),
              // showing project name with the number of project members
              // 0 members: No members
              // 1 member: 1 profile is shown
              // 2 members: 2 profiles are shown
              // 3 members: 3 profiles are shown
              // > 3 members: 3 profiles, alongwith a plus and total members - 3
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.projectName,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if (currentOrientation == Orientation.landscape &&
                          widget.members != '0')
                        const Text('Members'),
                      switch (widget.members) {
                        '0' => const Text('No members'),
                        '1' => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              child: Image.asset(
                                  'assets/images/default_profile_32px.png'),
                              onTap: () {},
                            ),
                          ),
                        '2' => Container(
                            width: screenWidth / 3,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 20.0,
                                  child: InkWell(
                                    child: Image.asset(
                                        'assets/images/default_profile_32px.png'),
                                    onTap: () {},
                                  ),
                                ),
                                Positioned(
                                  child: InkWell(
                                    child: Image.asset(
                                        'assets/images/default_profile_32px.png'),
                                    onTap: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        '3' => Container(
                            width: screenWidth / 3,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 50,
                                  child: InkWell(
                                    child: Image.asset(
                                        'assets/images/default_profile_32px.png'),
                                    onTap: () {},
                                  ),
                                ),
                                Positioned(
                                  left: 25.0,
                                  child: InkWell(
                                    child: Image.asset(
                                        'assets/images/default_profile_32px.png'),
                                    onTap: () {},
                                  ),
                                ),
                                Positioned(
                                  child: InkWell(
                                    child: Image.asset(
                                        'assets/images/default_profile_32px.png'),
                                    onTap: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        _ => Container(
                            width: screenWidth / 3,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 40,
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                      left: 35.0,
                                      right: 5.0,
                                      top: 6.0,
                                      bottom: 6.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.blueGrey.shade200,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Text(
                                      '+ ${int.parse(widget.members) - 3}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 40,
                                  child: InkWell(
                                    child: Image.asset(
                                        'assets/images/default_profile_32px.png'),
                                    onTap: () {},
                                  ),
                                ),
                                Positioned(
                                  left: 20.0,
                                  child: InkWell(
                                    child: Image.asset(
                                        'assets/images/default_profile_32px.png'),
                                    onTap: () {},
                                  ),
                                ),
                                Positioned(
                                  child: InkWell(
                                    child: Image.asset(
                                        'assets/images/default_profile_32px.png'),
                                    onTap: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                      },
                    ],
                  ),
                ],
              ),
              // the project name with the profiles widget ends here
              ElevatedButton(
                style: ButtonStyle(
                  maximumSize: MaterialStateProperty.all(
                    Size(
                      screenWidth / 2,
                      50,
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Theme.of(context).scaffoldBackgroundColor),
                  foregroundColor: MaterialStateProperty.all(Colors.grey.shade700),
                  elevation: MaterialStateProperty.all(0.0),
                  side: MaterialStateProperty.all(
                    BorderSide(
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
                onPressed: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.person),
                    Text('Invite Members'),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey.shade500,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: tabs.map<Widget>(
                    (tabName) {
                      return Container(
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: currentTab == tabName
                                  ? const Color.fromARGB(255, 0, 115, 234)
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Text(tabName),
                      );
                    },
                  ).toList(),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: Column(
                  children: [
                    switch (currentTab) {
                      'Project Overview' => const ProjectOverview(),
                      'Scope & stack' => const ScopeAndStack(),
                      'Escalation matrix' => const EscalationMatrix(),
                      _ => Text(currentTab),
                    },
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        switch (currentTab) {
                          case 'Project Overview':
                            setCurrentTab('Scope & stack');
                          case 'Scope & stack':
                            setCurrentTab('Escalation matrix');
                          default:
                            return;
                        }
                      },
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                          Size(screenWidth, 50),
                        ),
                      ),
                      child: const Text('Continue'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectOverview extends StatelessWidget {
  const ProjectOverview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Project brief'),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          maxLines: 5,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade500,
                width: 0.5,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(),
            ),
            hintText: 'Write project brief here',
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text('Purpose'),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          maxLines: 3,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade500,
                width: 0.5,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(),
            ),
            hintText: 'Write project purpose here',
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text('Goals'),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          maxLines: 3,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade500,
                width: 0.5,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(),
            ),
            hintText: 'Write project goals here',
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text('Objectives'),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          maxLines: 3,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade500,
                width: 0.5,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(),
            ),
            hintText: 'Write project objectives here',
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text('Budget'),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            TextFormField(
              decoration: InputDecoration(
                constraints: const BoxConstraints(
                  maxWidth: 100,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade500,
                    width: 0.5,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
                hintText: '9999',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              width: 5,
            ),
            const Text('US Dollar'),
          ],
        ),
      ],
    );
  }
}

class ScopeAndStack extends StatefulWidget {
  const ScopeAndStack({
    super.key,
  });

  @override
  State<ScopeAndStack> createState() => _ScopeAndStackState();
}

class _ScopeAndStackState extends State<ScopeAndStack> {
  String selectedOptionFromDropdown = 'Backend';
  List<String> listOfTechnologies = [
    'Backend',
    'Front-end',
    'Mobile app',
    'Database',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Select Project Technologies'),
        DropdownButton(
          icon: const Icon(
            Icons.keyboard_arrow_down_outlined,
          ),
          isExpanded: true,
          value: selectedOptionFromDropdown,
          onChanged: (value) {
            setState(() {
              selectedOptionFromDropdown = value ?? 'Project Manager One';
            });
          },
          items:
              listOfTechnologies.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text('Project Scope'),
        TextFormField(
          maxLines: 3,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade500,
                width: 0.5,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(),
            ),
            hintText: 'Write here',
          ),
        ),
      ],
    );
  }
}

class EscalationMatrix extends StatefulWidget {
  const EscalationMatrix({super.key});

  @override
  State<EscalationMatrix> createState() => _EscalationMatrixState();
}

class _EscalationMatrixState extends State<EscalationMatrix> {
  List<String> tableHeaders = [
    'Escalation Level',
    'Name',
    'Role',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Operational Escalation Matrix',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        EscalationMatrixTable(tableHeaders: tableHeaders),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Financial Escalation Matrix',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        EscalationMatrixTable(tableHeaders: tableHeaders),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Technical Escalation Matrix',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        EscalationMatrixTable(tableHeaders: tableHeaders),
      ],
    );
  }
}

class EscalationMatrixTable extends StatefulWidget {
  const EscalationMatrixTable({
    super.key,
    required this.tableHeaders,
  });
  final List<String> tableHeaders;

  @override
  State<EscalationMatrixTable> createState() => _EscalationMatrixTableState();
}

class _EscalationMatrixTableState extends State<EscalationMatrixTable> {
  var listOfPersons = [
    {
      'name': 'Dipa Majumdar',
      'role': 'Project Manager',
    },
    {
      'name': 'Person 2',
      'role': 'Role 2',
    },
    {
      'name': 'Person 3',
      'role': 'Role 3',
    },
  ];

  String level1State = 'Dipa Majumdar';
  String level2State = 'Dipa Majumdar';
  String level3State = 'Dipa Majumdar';

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      border: TableBorder.symmetric(
        outside: BorderSide(
          color: Colors.grey.shade300,
        ),
      ),
      children: [
        TableRow(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                color: Colors.grey.shade400,
              ),
            ),
          ),
          children: widget.tableHeaders.map<Widget>(
            (tableHeader) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4.0, vertical: 6.0),
                child: Text(
                  tableHeader,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            },
          ).toList(),
        ),
        TableRow(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                color: Colors.grey.shade400,
              ),
            ),
          ),
          children: [
            const Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 4.0, vertical: 6.0),
              child: Text(
                'Level 1',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 4.0,
                horizontal: 2.0,
              ),
              child: DropdownButton(
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  size: 15,
                ),
                isExpanded: true,
                style: const TextStyle(
                  fontSize: 12.5,
                  color: Colors.black,
                ),
                items: listOfPersons.map<DropdownMenuItem>(
                  (person) {
                    return DropdownMenuItem(
                      value: person['name'],
                      child: Text('${person['name']}'),
                    );
                  },
                ).toList(),
                onChanged: (value) {
                  setState(() {
                    level1State = value;
                  });
                },
                value: level1State,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(listOfPersons
                      .where((person) => person['name'] == level1State)
                      .first['role'] ??
                  'Project Manager'),
            ),
          ],
        ),
        TableRow(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                color: Colors.grey.shade400,
              ),
            ),
          ),
          children: [
            const Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 4.0, vertical: 6.0),
              child: Text(
                'Level 2',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 4.0,
                horizontal: 2.0,
              ),
              child: DropdownButton(
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  size: 15,
                ),
                isExpanded: true,
                style: const TextStyle(
                  fontSize: 12.5,
                  color: Colors.black,
                ),
                items: listOfPersons.map<DropdownMenuItem>(
                  (person) {
                    return DropdownMenuItem(
                      value: person['name'],
                      child: Text('${person['name']}'),
                    );
                  },
                ).toList(),
                onChanged: (value) {
                  setState(() {
                    level2State = value;
                  });
                },
                value: level2State,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(listOfPersons
                      .where((person) => person['name'] == level2State)
                      .first['role'] ??
                  'Project Manager'),
            ),
          ],
        ),
        TableRow(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                color: Colors.grey.shade400,
              ),
            ),
          ),
          children: [
            const Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 4.0, vertical: 6.0),
              child: Text(
                'Level 3',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 4.0,
                horizontal: 2.0,
              ),
              child: DropdownButton(
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  size: 15,
                ),
                isExpanded: true,
                style: const TextStyle(
                  fontSize: 12.5,
                  color: Colors.black,
                ),
                items: listOfPersons.map<DropdownMenuItem>(
                  (person) {
                    return DropdownMenuItem(
                      value: person['name'],
                      child: Text('${person['name']}'),
                    );
                  },
                ).toList(),
                onChanged: (value) {
                  setState(() {
                    level3State = value;
                  });
                },
                value: level3State,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(listOfPersons
                      .where((person) => person['name'] == level3State)
                      .first['role'] ??
                  'Project Manager'),
            ),
          ],
        ),
      ],
    );
  }
}
