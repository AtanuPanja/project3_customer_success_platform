import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class ScopeAndStack extends StatefulWidget {
  const ScopeAndStack({
    super.key, 
    required this.scope, 
    required this.scopeController, 
    required this.stack,
    required this.setSelectedStack, 
  });

  final String? scope;
  final TextEditingController scopeController;
  final String? stack;
  final Function(String) setSelectedStack;

  @override
  State<ScopeAndStack> createState() => _ScopeAndStackState();
}

class _ScopeAndStackState extends State<ScopeAndStack> {
  String selectedOptionFromDropdown = '';
  List<String> listOfTechnologies = [
    'Backend',
    'Frontend',
    'Database',
    'Mobile-App'
  ];

  @override
  void initState() {
    super.initState();
    developer.log(widget.stack ?? 'no stack', name: 'widget.stack - Scope and stack');
    selectedOptionFromDropdown = widget.stack ?? '';
  }

  @override
  Widget build(BuildContext context) {
      widget.scopeController.text = widget.scope ?? '';
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
              selectedOptionFromDropdown = value ?? 'Backend';
              widget.setSelectedStack(selectedOptionFromDropdown);
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
          controller: widget.scopeController,
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
