import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;

import '../model/manager.dart';
import '../providers/managers_list_provider.dart';

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

  // this state variable is used to track the selected option from the dropdown menu
  String selectedManager = 'Manager 3';
  void setSelectedManager(String manager) {
    setState(() {
      selectedManager = manager;
    });
  }

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<ManagersListProvider>(context, listen: false);
    provider.getManagersData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ManagersListProvider>(
      builder: (context, value, child) {
        final managers = value.managers;
        developer.log(managers.toString(), name: 'Create project third step');
        return DropdownButton(
          value: selectedManager,
          icon: const Icon(
            Icons.keyboard_arrow_down_outlined,
          ),
          isExpanded: true,
          onChanged: (managerName) {
            setSelectedManager(managerName ?? managers[0].name);
            widget
                .setSelectedOptionFromDropdown(managerName ?? managers[0].name);
          },
          items: managers.map<DropdownMenuItem<String>>((Manager manager) {
            return DropdownMenuItem(
              value: manager.name,
              child: Text(manager.name),
            );
          }).toList(),
        );
      },
    );
  }
}
