import 'package:flutter/material.dart';

import '../utils/colors.dart';

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

  List<Map<String, String>> levels = [
    {
      'name': 'Level 1',
      'state': 'Dipa Majumdar',
    },
    {
      'name': 'Level 2',
      'state': 'Dipa Majumdar',
    },
    {
      'name': 'Level 3',
      'state': 'Dipa Majumdar',
    },
  ];

  @override
  Widget build(BuildContext context) {
    bool darkModeIsActive =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
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
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            },
          ).toList(),
        ),
        ...levels.map<TableRow>((level) {
          return TableRow(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade400,
                ),
              ),
            ),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 6.0),
                child: Text(
                  level['name'] ?? 'Null level',
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
                  style: TextStyle(
                    color: darkModeIsActive
                        ? AppColors.appDarkFgColor
                        : AppColors.appFgColor,
                    fontSize: 12.5,
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
                      level['state'] = value;
                    });
                  },
                  value: level['state'],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(listOfPersons
                        .where((person) => person['name'] == level['state'])
                        .first['role'] ??
                    'Project Manager'),
              ),
            ],
          );
        }),
      ],
    );
  }
}
