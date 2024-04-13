import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;

import '../api/api_service.dart';
import '../utils/constants/api_endpoints.dart';
import 'projects_list_provider.dart';

// This will provide the state for updating the existing project
class UpdateProjectProvider extends ChangeNotifier {

  // fields needed for updating a project details
  String id = '';
  String overview = '';
  String budgetValue = '';
  Map<String, String> stack = <String,String>{
    'label': '',
    'value': ''
  };
  String scope = '';

  // setters for the fields
  set setId(String id) {
    this.id = id;
  }

  set setOverview(String overview) {
    this.overview = overview;
  }

  set setBudgetValue(String budgetValue) {
    this.budgetValue = budgetValue;
  }

  set setStack(Map<String, String> stack) {
    this.stack = {
      'label': stack['label'] ?? '',
      'value': stack['value'] ?? ''
    };
  }

  set setScope(String scope) {
    this.scope = scope;
  }

  // this method creates a map instance named data, and sends a post request (update is being done using post request, as per the API structure)
  Future<bool> updateProjectData(BuildContext context) async {
    Map<String, dynamic> data = {
      'projectDetails': {
        'overview': overview,
        'budget': {
          'type': 'Monthly',
          'type_value': budgetValue,
        },
        'timeline': 'project timeline',
        'stack': stack,
        'scope': scope,
      }
    };

    developer.log(data.toString(),
        name: 'data created in update project provider');
    /*

    {
    "projectDetails": {
        "overview": "project overview",
        "budget": {
            "type": "Monthly",
            "type_value": "10"
        },
        "timeline": "project timeline",
        "stack": {
            "label": "Mobile-App",
            "value": "mobile_app"
        },
        "scope": "scope of project"
    }
}
   */
    developer.log(ApiEndpoints.updateProject.replaceAll(':id', id), name: 'Update endpoint');

    // update project, also done as post request, - one update url, where :id is being replaced with the project id, making a different endpoint for each project
    // the network call and the url endpoint are abstracted out in separate files
    bool updateSuccess =
        await ApiService.postHTTP(ApiEndpoints.updateProject.replaceAll(':id', id), data);
    notifyListeners();

    // context.mounted check before accessing context inside an async function
    if (context.mounted) {

      // after updating the project, fetching the new project list
      Provider.of<ProjectsListProvider>(context, listen: false)
          .getProjectsData();
    }
    developer.log(updateSuccess.toString(), name: 'Update success - Update project provider');
    return updateSuccess;
  }
}
