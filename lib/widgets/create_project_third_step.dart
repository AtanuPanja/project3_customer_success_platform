import 'package:flutter/material.dart';
import 'package:project3_customer_success_platform/model/manager.dart';
import 'package:project3_customer_success_platform/providers/managers_list_provider.dart';
import 'package:provider/provider.dart';

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
        return DropdownButton(
          icon: const Icon(
            Icons.keyboard_arrow_down_outlined,
          ),
          isExpanded: true,
          value: widget.selectedOptionFromDropdown,
          onChanged: (managerName) {
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
