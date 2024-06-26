import 'package:flutter/material.dart';
import '../data/list_of_projects.dart' as projects_data;
import '../utils/colors.dart';
import '../widgets/create_project_first_step.dart';
import '../widgets/create_project_second_step.dart';
import '../widgets/create_project_third_step.dart';

class CreateProjectScreen extends StatefulWidget {
  const CreateProjectScreen({
    super.key,
    required this.updateListOfProjects,
  });

  final VoidCallback updateListOfProjects;

  @override
  State<CreateProjectScreen> createState() => _CreateProjectScreenState();
}

class _CreateProjectScreenState extends State<CreateProjectScreen> {
  // state variable to handle the form state
  final GlobalKey<FormState> _firstFormKey = GlobalKey<FormState>();
  final FocusNode projectNameFocus = FocusNode();

  // this controller holds the value entered into the project name field
  TextEditingController projectNameController = TextEditingController();

  // this state variable is used to keep track of which step of the multi-step form is currently active
  int currentStep = 0;

  // this state variable is used to track the selected option from the dropdown menu
  String selectedOptionFromDropdown = 'Project Manager One';

  // sets the selected option from dropdown, to handle the onchange event
  void setSelectedOptionFromDropdown(String selected) {
    setState(() {
      selectedOptionFromDropdown = selected;
    });
  }

  // list to populate the dropdown for selection
  List<String> listOfProjectManagers = [
    'Project Manager One',
    'Project Manager Two',
    'Project Manager Three',
    'Project Manager Four'
  ];

  // there are three steps

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: AppColors.primaryDarkBlue,
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
                    if (currentStep == 0) {
                      // currentStep = 0, denotes the first form
                      // here we validate the project name field.
                      // calling the formKey.currentKey.validate() method, calls the validator as defined in the textformfield
                      bool firstFormIsValid =
                          _firstFormKey.currentState?.validate() ?? false;
                      if (!firstFormIsValid) {
                        return;
                      }
                      currentStep += 1;
                    } else if (currentStep == 2) {
                      projects_data.addNewProject(projectNameController.text);
                      widget.updateListOfProjects();
                      Navigator.of(context).pop();
                    } else {
                      currentStep += 1;
                    }
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
              return Text(
                '${stepIndex + 1}',
                style: const TextStyle(
                  color: Colors.white,
                ),
              );
            }
          },
          currentStep: currentStep,
          steps: [
            Step(
              isActive: currentStep >= 0,
              title: const Text('Project Details'),
              content: CreateProjectFirstStep(
                  firstFormKey: _firstFormKey,
                  projectNameFocus: projectNameFocus,
                  projectNameController: projectNameController),
            ),
            Step(
              isActive: currentStep >= 1,
              title: const Text('Invite client'),
              content: const CreateProjectSecondStep(),
            ),
            Step(
              isActive: currentStep >= 2,
              title: const Text('Select Project Manager'),
              content: CreateProjectThirdStep(
                  selectedOptionFromDropdown: selectedOptionFromDropdown,
                  setSelectedOptionFromDropdown: setSelectedOptionFromDropdown),
            ),
          ],
        ),
      ),
    );
  }
}
