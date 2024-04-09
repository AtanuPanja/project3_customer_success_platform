import 'package:flutter/material.dart';

class CreateProjectThirdStep extends StatefulWidget {
  final String selectedOptionFromDropdown;
  final Function(String) setSelectedOptionFromDropdown;

  const CreateProjectThirdStep({
    super.key,
    required this.selectedOptionFromDropdown,
    required this.setSelectedOptionFromDropdown,
  });

  @override
  State<CreateProjectThirdStep> createState() => _CreateProjectThirdStepState();
}

class _CreateProjectThirdStepState extends State<CreateProjectThirdStep> {
  List<String> listOfProjectManagers = [
    'Project Manager One',
    'Project Manager Two',
    'Project Manager Three',
    'Project Manager Four'
  ];
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      icon: const Icon(
        Icons.keyboard_arrow_down_outlined,
      ),
      isExpanded: true,
      value: widget.selectedOptionFromDropdown,
      onChanged: (value) {
        widget.setSelectedOptionFromDropdown(value ?? 'Project Manager One');
      },
      items:
          listOfProjectManagers.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
