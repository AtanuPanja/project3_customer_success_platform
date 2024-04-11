import 'package:dio/dio.dart';
import 'dart:developer' as developer;
import '../utils/constants/api_endpoints.dart';

// This class will provide all get and post methods related to dio network package.
class ApiService {
  // creating a private constructor, to avoid initialization of this class
  // this class will be used only by its name; also all methods are static, so that they can be accessed directly by the class name
  ApiService._();

  // private dio instance - initialized with the baseUrl as defined in the ApiEndpoints class
  static final Dio _dio = Dio(
    BaseOptions(baseUrl: ApiEndpoints.baseUrl),
  );
  
  // get data from api, and return as Map type of data, which is the response format in the api
  static Future<dynamic> getHTTP(String path) async {
    try {
      Response response = await _dio.get(path);
      // developer.log(response.data.toString());
      return response.data;
    } catch (e) {
      developer.log(e.toString(), name: 'Error in fetching data');
      return {};
    }
  }

  // post data to the api, and check whether the operation is successful
  static Future<bool> postHTTP(String path, Map<String,dynamic> body) async {
    try {
      Response response = await _dio.post(path, data: body);
      developer.log(response.data.toString(), name: 'Response data in ApiService posthttp');
      int responseStatusCode = response.statusCode ?? 404;
      return (responseStatusCode >= 200 && responseStatusCode < 300);
    } catch (e) {
      developer.log(e.toString(), name: 'Error in posting data');
      return false;
    }
  }
}
