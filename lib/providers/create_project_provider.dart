import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import 'package:project3_customer_success_platform/providers/managers_list_provider.dart';
import 'package:project3_customer_success_platform/providers/projects_list_provider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

import '../api/api_service.dart';
import '../utils/constants/api_endpoints.dart';

// This will provide the state for adding new project
// it has methods to set project name, manager ID, and manager name
// postProjectsData method creates a data object, and posts the data by calling the endpoint
class CreateProjectProvider extends ChangeNotifier {
  
  late String projectName;
  late String managerID;
  late String managerName;
  
  set setProjectName(String name) {
    projectName = name;
  }

  set setManagerName(String name) {
    managerName = name;
  }

  Future<bool> postProjectData(BuildContext context) async {
    Map<String,dynamic> data = {};
    data['_id'] = const Uuid().v4();
    data['name'] = projectName;
    data['associated_manager'] = {};
    final managers = Provider.of<ManagersListProvider>(context, listen: false).managers;
    developer.log(managers.toString(), name: 'managers fetched in CreateProjectProvider');
    data['associated_manager']['_id'] = managers.where((manager) => manager.name == managerName).toList()[0].userId;
    data['associated_manager']['name'] = managerName;
    data['associated_manager']['designation'] = 'Manager';
    data['status'] = 'On-Going';
    data['start_date'] = DateFormat('y-MM-dd').format(DateTime.now()).toString();

    developer.log(data.toString(), name: 'data created in create project provider');
    /*
    {
      "_id": "{Id of Project}",
      "name": "{Name of Project}",
      "associated_manager": {
          "_id": "{id of user}",
          "name": "{name of manager}",
          "designation": "Manager"
      },
      "status": "On-Going",
      "start_date": "{Project creation date}"
    }
     */
    bool postSuccess = await ApiService.postHTTP(ApiEndpoints.postProject, data);
    notifyListeners();
    if (context.mounted) {
      Provider.of<ProjectsListProvider>(context, listen: false).getProjectsData();
    }
    return postSuccess;
  }

}