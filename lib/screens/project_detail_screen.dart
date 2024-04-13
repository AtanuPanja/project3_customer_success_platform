import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import 'package:provider/provider.dart';

import '../utils/colors.dart';

import '../model/project.dart';
import '../providers/update_project_provider.dart';

import '../widgets/breadcrumbs.dart';
import '../widgets/project_overview.dart';
import '../widgets/scope_and_stack.dart';
import '../widgets/escalation_matrix.dart';
import '../widgets/display_members_profiles.dart';

// this screen gets the project data from the project list item, inside project screen
class ProjectDetailsScreen extends StatefulWidget {
  const ProjectDetailsScreen({
    super.key,
    required this.project,
  });

  final Project project;

  @override
  State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {

  // These variables handle the combined state of all the active tabs
  TextEditingController overviewController = TextEditingController(); // overview text
  TextEditingController budgetValueController = TextEditingController(); // budget text (leaving the budget type)
  TextEditingController scopeController = TextEditingController(); // scope text

  // stack state to saved and updated
  Map<String, String> selectedStack = {
    'label': 'Backend',
    'value': 'backend',
  };

  // tab in the project detail screen, initially Project Overview
  String currentTab = 'Project Overview';
  // list of tabs to populate all the tabs
  List<String> tabs = [
    'Project Overview',
    'Scope & stack',
    'Escalation matrix',
  ];

  // method to update the selected stack based on the selected stack from the dropdown
  void setSelectedStack(String stack) {
    var value = switch (stack) {
      'Frontend' => 'frontend',
      'Backend' => 'backend',
      'Mobile-App' => 'mobile_app',
      'Database' => 'database',
      'Infrastructure and Services' => 'infrastructure_and_services',
      _ => ''
    };
    selectedStack['label'] = stack;
    selectedStack['value'] = value;

    setState(() {});
  }

  // method to switch tabs in the project detail screen
  void setCurrentTab(String tabName) {
    setState(() {
      currentTab = tabName;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var currentOrientation = MediaQuery.of(context).orientation;

    // consume update project provider, and set the values when input is done
    return Consumer<UpdateProjectProvider>(
      builder: (context, updateProjectProvider, child) {

        // set the project id, in the update project provider, because it is important for creating the project update endpoint
        updateProjectProvider.setId = widget.project.id;
        developer.log((updateProjectProvider.stack['label'] ?? widget.project.stack?.label).toString(), name: 'stack passed to scope and stack - ProjectDetailScreen');
        return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // bread crumbs are abstracted to a reusable widget in a separate file
                BreadCrumbs(
                  projectName: widget.project.name,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.project.name,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        // in landscape orientation, it displays as: Members then the profile images
                        // in portrait orientation, it doesn't display the Members word
                        if (currentOrientation == Orientation.landscape &&
                            widget.project.members != 0)
                          const Text('Members'),
                        // the code has been extracted to a reusable widget in a different file
                        DisplayMembersProfiles(
                          members: widget.project.members, 
                          screenWidth: screenWidth,
                        ),
                      ],
                    ),
                  ],
                ),
                
                ElevatedButton(
                  style: ButtonStyle(
                    maximumSize: MaterialStateProperty.all(
                      Size(
                        screenWidth / 2,
                        50,
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).scaffoldBackgroundColor),
                    foregroundColor:
                        MaterialStateProperty.all(AppColors.dividerColor),
                    elevation: MaterialStateProperty.all(0.0),
                    side: MaterialStateProperty.all(
                      BorderSide(
                        color: AppColors.dividerColor,
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.person),
                      Text('Invite Members'),
                    ],
                  ),
                ),
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
                        return InkWell(
                          onTap: ()  {
                            switch (currentTab) {
                            case 'Project Overview':
                              updateProjectProvider.setScope = scopeController.text;
                              updateProjectProvider.setStack = selectedStack;
                            case 'Scope & stack':
                              updateProjectProvider.setOverview = overviewController.text;
                              updateProjectProvider.setBudgetValue = budgetValueController.text;
                            case 'Escalation matrix':
                              updateProjectProvider.setOverview = overviewController.text;
                              updateProjectProvider.setBudgetValue = budgetValueController.text;
                              updateProjectProvider.setScope = scopeController.text;
                              updateProjectProvider.setStack = selectedStack;
                            default:
                              return;
                          }
                            setCurrentTab(tabName);
                          },
                          child: Container(
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
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                  child: Column(
                    children: [
                      switch (currentTab) {
                        'Project Overview' => ProjectOverview(
                            overview: updateProjectProvider.overview.isEmpty ? widget.project.overview: updateProjectProvider.overview,
                            overviewController: overviewController,
                            budgetValue: updateProjectProvider.budgetValue.isEmpty ? widget.project.budget?.typeValue: updateProjectProvider.budgetValue,
                            budgetValueController: budgetValueController,
                          ),
                        'Scope & stack' => ScopeAndStack(
                            scope: updateProjectProvider.scope.isEmpty ? widget.project.scope: updateProjectProvider.scope,
                            scopeController: scopeController,
                            stack: updateProjectProvider.stack['label'],
                            setSelectedStack: setSelectedStack,
                          ),
                        'Escalation matrix' => const EscalationMatrix(),
                        _ => Text(currentTab),
                      },
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          switch (currentTab) {
                            case 'Project Overview':
                              updateProjectProvider.setOverview = overviewController.text;
                              updateProjectProvider.setBudgetValue = budgetValueController.text;
                              setCurrentTab('Scope & stack');
                            case 'Scope & stack':
                              updateProjectProvider.setScope = scopeController.text;
                              updateProjectProvider.setStack = selectedStack;
                              setCurrentTab('Escalation matrix');
                            case 'Escalation matrix':
                              updateProjectProvider.setOverview = overviewController.text;
                              updateProjectProvider.setBudgetValue = budgetValueController.text;
                              updateProjectProvider.setScope = scopeController.text;
                              updateProjectProvider.setStack = selectedStack;
                              updateProjectProvider.updateProjectData(context);
                              Navigator.of(context).pop();
                            default:
                              return;
                          }
                        },
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                            Size(screenWidth, 50),
                          ),
                        ),
                        child: const Text('Continue'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
      },
      
    );
  }
}
