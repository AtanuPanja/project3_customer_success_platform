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
      body: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: const Color.fromARGB(255, 0, 115, 234),
          ),
        ),
        child: Stepper(
          controlsBuilder: (context, details) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
                  ),
                ),
                child: Text(currentStep == 1 ? 'Send invite' : 'Continue'),
                onPressed: () {
                  setState(() {
                    // since there are three steps, steps.length replaced with 3
                    if (currentStep < 3 - 1) {
                      currentStep += 1;
                    } else {}
                  });
                },
              ),
            );
          },
          stepIconBuilder: (stepIndex, stepState) {
            if (stepIndex <= currentStep) {
              return const Icon(
                Icons.check,
                size: 16,
                color: Colors.white,
              );
            } else {
              return Text('${stepIndex + 1}', style: const TextStyle(color: Colors.white,),);
            }
          },
          currentStep: currentStep,
          steps: [
            Step(
              isActive: currentStep >= 0,
              title: const Text('Project Details'),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Project name *'),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
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
                          hintText: 'Placeholder text here',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Column(
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
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                    ],
                  ),
                ],
              ),
            ),
            Step(
              isActive: currentStep >= 1,
              title: const Text('Invite client'),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Client name'),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade700,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      hintText: 'Name here',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Client email'),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade700,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      hintText: 'example@work.com',
                    ),
                  ),
                  const SizedBox(
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
                          const Color.fromARGB(45, 0, 113, 234)),
                    ),
                    child: const Row(
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
              isActive: currentStep >= 2,
              title: const Text('Select Project Manager'),
              content: DropdownButton(
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
                items: listOfProjectManagers
                    .map<DropdownMenuItem<String>>((String value) {
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
