import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:developer' as developer;

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
    List<Project> listOfProjects = [];
    Map<dynamic, dynamic> data = await ApiService.getHTTP(ApiEndpoints.getAllProjects);

    // this has been done because, 'data' property contains the array of the projects
    // and if the 'data' property is not present, it will throw errors
    // also, this is not handled during the api call in the getHTTP method, because
    // for the listofprojects api, we have a response with a property 'data'
    // however, for other apis, it may not be the same. 
    if (data['data'] == null) {
      // data == {} was unsuccessful in checking for empty map object
      // so replaced it with data['data'] == null

      data = {
        'data': [],
      };
    }
    // projects = data['data'];
    
    // developer.log(data.toString(), name: 'ProjectsListProvider - data');
    developer.log(data['data'].toString(), name: 'ProjectsListProvider - data[data]');
    // developer.log(data['data'].toString(), name: 'ProjectsListProvider - data[data]');
    // developer.log(data['data'][0].toString(), name: 'ProjectsListProvider - data[data][0]');
    for (Map<String,dynamic> project in data['data']) {
      // developer.log(project.toString(), name: 'ProjectsListProvider - data[data][index]');
      try {
        // this is done because when the stack is not entered, it is an empty string (different from budget which has the empty object),
        // but it should be an object whose fields are empty strings
        // this gave error; so it has been converted to object after fetching of the data.
        if (project['stack'] == '') {
          project['stack'] = {
            'label': '',
            'value': '',
          };
        }
        project['members'] = (Random().nextInt(99) + 1);
        listOfProjects.add(Project.fromJson(project));
      } catch (e) {
        developer.log(project.toString(), name: 'ProviderProjectsList Error');
        developer.log(e.toString(), name: 'Error description');
      }
    }
    projects = listOfProjects;
    developer.log(projects.toString(), name: 'ProjectsListProvider - projects');
    
    notifyListeners();
  }
}