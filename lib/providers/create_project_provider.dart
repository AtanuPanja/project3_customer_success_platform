import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'managers_list_provider.dart';
import 'projects_list_provider.dart';

import '../api/api_service.dart';
import '../utils/constants/api_endpoints.dart';

// This will provide the state for adding new project
// it has methods to set project name, manager ID, and manager name
// postProjectsData method creates a data object, and posts the data by calling the endpoint
class CreateProjectProvider extends ChangeNotifier {
  
  // fields needed for the creation of project
  late String projectName;
  late String managerID;
  late String managerName;
  
  // setters for the fields
  set setProjectName(String name) {
    projectName = name;
  }

  set setManagerName(String name) {
    managerName = name;
  }

  // this method takes the data from the fields, and posts the data from the api, by making a network call to the createproject endpoint
  Future<bool> postProjectData(BuildContext context) async {

    // creating the data object to send to the backend
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

    // post request - the url and the network have been abstracted to other folders
    bool postSuccess = await ApiService.postHTTP(ApiEndpoints.postProject, data);

    // this notifies any state changes to the provider classes
    notifyListeners();

    // use build context synchronously
    // checking if the context is mounted using the context.mounted condition, before using the context
    if (context.mounted) {

      // updating the project listing after the create project has been completed, so that the new project is visible in the list
      Provider.of<ProjectsListProvider>(context, listen: false).getProjectsData();
    }
    return postSuccess;
  }

}