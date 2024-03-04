import 'package:flutter/material.dart';

class NewProjectStepper extends StatefulWidget {
  const NewProjectStepper({super.key});

  @override
  State<NewProjectStepper> createState() => _NewProjectStepperState();
}

class _NewProjectStepperState extends State<NewProjectStepper> {
  int currentStep = 0;
  List<Step> steps = [
    Step(
      title: Text('Project Details'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Project name'),
          SizedBox(height: 5,),
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
      title: Text('Step 2'),
      content: Text('Content for Step 2'),
    ),
    Step(
      title: Text('Step 3'),
      content: Text('Content for Step 3'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stepper(
          currentStep: currentStep,
            onStepContinue: () {
              setState(() {
                if (currentStep < steps.length - 1) {
                  currentStep += 1;
                } else {
                }
              });
            },
            steps: steps,
        ),
      ),
    );
  }
}