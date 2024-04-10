import 'package:flutter/material.dart';
// import 'dart:developer' as developer;

import 'package:project3_customer_success_platform/api/api_service.dart';
import 'package:project3_customer_success_platform/model/project.dart';
import 'package:project3_customer_success_platform/utils/constants/api_endpoints.dart';

// this will provide the projects state in the Consumer widgets
// holding the global projects state
class ProjectsListProvider extends ChangeNotifier {

  List<Project> projects = [];

  // fetch and save into state
  // notify the listeners for the change in the data, to update the UI
  // provider pattern for state management
  void getProjectsData() async {
    Map<String, dynamic> data = await ApiService.getHTTP(ApiEndpoints.getAllProjects);
    if (data == {}) {
      data = {
        'data': [],
      };
    }
    // projects = data['data'];
    
    // developer.log(data.toString(), name: 'ProjectsListProvider - data');
    // developer.log(data['data'].toString(), name: 'ProjectsListProvider - data[data]');
    // developer.log(data['data'].toString(), name: 'ProjectsListProvider - data[data]');
    // developer.log(data['data'][0].toString(), name: 'ProjectsListProvider - data[data][0]');
    for (var project in data['data']) {
      // developer.log(project.toString(), name: 'ProjectsListProvider - data[data][index]');
      projects.add(Project.fromJSON(project));
    }
    // developer.log(projects.toString(), name: 'ProjectsListProvider - projects');
    
    notifyListeners();
  }
}