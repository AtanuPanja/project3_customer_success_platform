import 'package:flutter/material.dart';

class NewProjectStepper extends StatefulWidget {
  const NewProjectStepper({super.key});

  @override
  State<NewProjectStepper> createState() => _NewProjectStepperState();
}

class _NewProjectStepperState extends State<NewProjectStepper> {
  int currentStep = 0;

  String selectedOptionFromDropdown = 'Project Manager One';

  List<String> listOfProjectManagers = [
    'Project Manager One',
    'Project Manager Two',
    'Project Manager Three',
    'Project Manager Four',
  ];

  // there are three steps

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stepper(
          currentStep: currentStep,
          onStepContinue: () {
            setState(() {
              // since there are three steps, steps.length replaced with 3
              if (currentStep < 3 - 1) {
                currentStep += 1;
              } else {}
            });
          },
          steps: [
            Step(
              title: Text('Project Details'),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Project name *'),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade700,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      hintText: 'Placeholder text here',
                    ),
                  ),
                ],
              ),
            ),
            Step(
              title: Text('Invite client'),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Client name'),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade700,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      hintText: 'Name here',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Client email'),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade700,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      hintText: 'example@work.com',
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  OutlinedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                      overlayColor: MaterialStateProperty.all(
                          Color.fromARGB(45, 0, 113, 234)),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.add),
                        Text('Add'),
                      ],
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Step(
              title: Text('Select Project Manager'),
              content: DropdownButton(
                icon: Icon(Icons.keyboard_arrow_down_outlined,),
                isExpanded: true,
                value: selectedOptionFromDropdown,
                onChanged: (value) {
                  setState(() {
                    selectedOptionFromDropdown = value ?? 'Project Manager One';
                  });
                },
                items: listOfProjectManagers.map<DropdownMenuItem<String>> ((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
