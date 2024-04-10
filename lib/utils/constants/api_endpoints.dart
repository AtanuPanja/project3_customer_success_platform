import 'api_role_constants.dart';

// this class will provide all the endpoints to use for the fetching of data
// currently this contains only the get endpoints
class ApiEndpoints {

  ApiEndpoints._();

  static const String baseUrl = "http://localhost:8000";
  static const String getManagers = "/getManagers?role_id=rol_qLO42FIvSNsdZEO4";
  static const String getAllProjects =
      "/projects?role=${ApiRoleConstants.admin}&id=${ApiRoleConstants.adminID}";
  static const String getManagerAssignedProjects =
      "/projects?role=${ApiRoleConstants.manager}&id=${ApiRoleConstants.managerID}";
  static const String getClientProjects = "/projects?role=${ApiRoleConstants.client}&id=${ApiRoleConstants.clientID}";
}
