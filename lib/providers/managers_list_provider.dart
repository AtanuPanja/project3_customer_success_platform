import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import '../api/api_service.dart';
import '../model/manager.dart';
import '../utils/constants/api_endpoints.dart';

// this will contain the state for list of managers, as fetched from the database
class ManagersListProvider extends ChangeNotifier {
  
  List<Manager> managers = [];

  void getManagersData() async {
    List<dynamic> data = await ApiService.getHTTP(ApiEndpoints.getManagers);

    for (Map<String,dynamic> manager in data) {
      developer.log(manager.toString(), name: 'ManagersListProvider - data[index]');
      managers.add(Manager.fromJson(manager));
      try {
        // this is done because when the stack is not entered, it is an empty string (different from budget which has the empty object),
        // but it should be an object whose fields are empty strings
        // this gave error; so it has been converted to object after fetching of the data.
        
      } catch (e) {
        developer.log(manager.toString(), name: 'ProviderManagersList Error');
        developer.log(e.toString(), name: 'Error description');
      }
    }
    developer.log(managers.toString(), name: 'ManagersListProvider - managers');
    
    notifyListeners();
  }

}