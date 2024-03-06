import 'package:flutter/material.dart';

class ProjectDetailsScreen extends StatefulWidget {
  const ProjectDetailsScreen({super.key});

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
        child: Column(
          children: [
            Text('Food on time'),
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
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  switch (currentTab) {
                    'Project Overview' => ProjectOverview(),
                    'Scope & stack' => ScopeAndStack(),
                    _ => Text(currentTab),
                  },
                  SizedBox(height: 20,),
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
