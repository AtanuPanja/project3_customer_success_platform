import 'api_role_constants.dart';
import 'dart:io' show Platform;

// this class will provide all the endpoints to use for the fetching of data
// currently this contains only the get endpoints
class ApiEndpoints {

  ApiEndpoints._();

  // in android the server would run at http://10.0.2.2:8000. So, this was necessary, as otherwise it won't fetch the data in android system
  // in ios system localhost:8000 works fine.
  // Reference: https://stackoverflow.com/questions/55785581/socketexception-os-error-connection-refused-errno-111-in-flutter-using-djan
  static final String baseUrl = Platform.isAndroid ? "http://10.0.2.2:8000": "http://localhost:8000";
  // Platform class from dart:io package helps us recognize the platform the app is built on

  static const String getManagers = "/getManagers?role_id=rol_qLO42FIvSNsdZEO4";
  static const String getAllProjects =
      "/projects?role=${ApiRoleConstants.admin}&id=${ApiRoleConstants.adminID}";
  static const String getManagerAssignedProjects =
      "/projects?role=${ApiRoleConstants.manager}&id=${ApiRoleConstants.managerID}";
  static const String getClientProjects = "/projects?role=${ApiRoleConstants.client}&id=${ApiRoleConstants.clientID}";

  static const String postProject = "/addProject";

}
