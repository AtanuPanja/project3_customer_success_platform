import 'package:flutter/material.dart';

class ProjectDetailsScreen extends StatefulWidget {
  const ProjectDetailsScreen({
    super.key,
    required this.projectName,
  });

  final String projectName;

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
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.card_travel_rounded, size: 12,),
                  SizedBox(width: 2,),
                  Text('Projects', style: TextStyle(fontSize: 12,),),
                  SizedBox(width: 2,),
                  Icon(Icons.arrow_forward_ios, size: 12,),
                  SizedBox(width: 2,),
                  Icon(Icons.business_center_outlined, size: 12,),
                  SizedBox(width: 2,),
                  Text(widget.projectName, style: TextStyle(fontSize: 12,),),
                  SizedBox(width: 2,),
                  Icon(Icons.arrow_forward_ios, size: 12,),
                ],
              ),
              SizedBox(height: 10,),
              Text(
                widget.projectName,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
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
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: Column(
                  children: [
                    switch (currentTab) {
                      'Project Overview' => ProjectOverview(),
                      'Scope & stack' => ScopeAndStack(),
                      'Escalation matrix' => EscalationMatrix(),
                      _ => Text(currentTab),
                    },
                    SizedBox(
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
                      child: Text('Continue'),
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                          Size(screenWidth, 50),
                        ),
                      ),
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
        Text('Project brief'),
        SizedBox(
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
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(),
            ),
            hintText: 'Write project brief here',
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text('Purpose'),
        SizedBox(
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
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(),
            ),
            hintText: 'Write project purpose here',
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text('Goals'),
        SizedBox(
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
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(),
            ),
            hintText: 'Write project goals here',
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text('Objectives'),
        SizedBox(
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
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(),
            ),
            hintText: 'Write project objectives here',
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text('Budget'),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            TextFormField(
              decoration: InputDecoration(
                constraints: BoxConstraints(
                  maxWidth: 100,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade500,
                    width: 0.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
                hintText: '9999',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              width: 5,
            ),
            Text('US Dollar'),
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
        Text('Select Project Technologies'),
        DropdownButton(
          icon: Icon(
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
        SizedBox(
          height: 5,
        ),
        Text('Project Scope'),
        TextFormField(
          maxLines: 3,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade500,
                width: 0.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
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
        Text('Operational Escalation Matrix', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,),),
        EscalationMatrixTable(tableHeaders: tableHeaders),
        SizedBox(height: 10,),
        Text('Financial Escalation Matrix', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,),),
        EscalationMatrixTable(tableHeaders: tableHeaders),
        SizedBox(height: 10,),
        Text('Technical Escalation Matrix', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,),),
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
  State<EscalationMatrixTable> createState() =>
      _EscalationMatrixTableState();
}

class _EscalationMatrixTableState
    extends State<EscalationMatrixTable> {
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
                padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 6.0),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 6.0),
              child: Text(
                'Level 1',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0,),
              child: DropdownButton(
                icon: Icon(Icons.keyboard_arrow_down, size: 15,),
                isExpanded: true,
                style: TextStyle(
                  fontSize: 12.5,
                  color: Colors.black,
                ),
                items: listOfPersons.map<DropdownMenuItem>((person) {
                  return DropdownMenuItem(
                    value: person['name'],
                    child: Text('${person['name']}'),
                  );
                },).toList(),
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
              child: Text(
                listOfPersons.where((person) => person['name'] == level1State).first['role'] ?? 'Project Manager'
              ),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 6.0),
              child: Text(
                'Level 2',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0,),
              child: DropdownButton(
                icon: Icon(Icons.keyboard_arrow_down, size: 15,),
                isExpanded: true,
                style: TextStyle(
                  fontSize: 12.5,
                  color: Colors.black,
                ),
                items: listOfPersons.map<DropdownMenuItem>((person) {
                  return DropdownMenuItem(
                    value: person['name'],
                    child: Text('${person['name']}'),
                  );
                },).toList(),
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
              child: Text(
                listOfPersons.where((person) => person['name'] == level2State).first['role'] ?? 'Project Manager'
              ),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 6.0),
              child: Text(
                'Level 3',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0,),
              child: DropdownButton(
                icon: Icon(Icons.keyboard_arrow_down, size: 15,),
                isExpanded: true,
                style: TextStyle(
                  fontSize: 12.5,
                  color: Colors.black,
                ),
                items: listOfPersons.map<DropdownMenuItem>((person) {
                  return DropdownMenuItem(
                    value: person['name'],
                    child: Text('${person['name']}'),
                  );
                },).toList(),
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
              child: Text(
                listOfPersons.where((person) => person['name'] == level3State).first['role'] ?? 'Project Manager'
              ),
            ),

          ],
        ),
      ],
    );
  }
}
