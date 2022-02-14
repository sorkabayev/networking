import 'dart:convert';
import 'package:http/http.dart';
import '../models/post_model.dart';
import 'log_service.dart';

class Network {
  static bool isTester = true;

  static String SERVER_DEVELOPMENT = "dummy.restapiexample.com";
  static String SERVER_PRODUCTION = "dummy.restapiexample.com";

  static Map<String, String> getHeaders() {
    Map<String,String> headers = {'Content-Type':'application/json; charset=UTF-8'};
    return headers;
  }

  static String getServer() {
    if (isTester) return SERVER_DEVELOPMENT;
    return SERVER_PRODUCTION;
  }

  /* Http Apis */
  static String API_LIST = "/api";
  static String API_CREATE = "/api/v1/create";
  static String API_UPDATE = "/api/v1/update"; //{id}
  static String API_DELETE = "/api/v1/delete"; //{id}


  /* Http Requests */

  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.http(getServer(), api, params); // http or https
    var response = await get(uri, headers: getHeaders());
    Log.d(response.body);
    if (response.statusCode == 200) return response.body;

    return null;
  }

  static Future<String?> POST(String api, Map<String, String> params) async {
    var uri = Uri.http(getServer(), api); // http or https
    var response = await post(uri, headers: getHeaders(), body: jsonEncode(params));
    Log.d(response.body);

    if (response.statusCode == 200 || response.statusCode == 201)
      return response.body;
    return null;
  }

  static Future<String?> PUT(String api, Map<String, String> params) async {
    var uri = Uri.http(getServer(), api); // http or https
    var response = await put(uri, headers: getHeaders(), body: jsonEncode(params));
    Log.d(response.body);

    if (response.statusCode == 200) return response.body;
    return null;
  }

  static Future<String?> PATCH(String api, Map<String, String> params) async {
    var uri = Uri.http(getServer(), api); // http or https
    var response = await patch(uri, headers: getHeaders(), body: jsonEncode(params));
    Log.d(response.body);
    if (response.statusCode == 200) return response.body;

    return null;
  }

  static Future<String?> DEL(String api, Map<String, String> params) async {
    var uri = Uri.http(getServer(), api, params); // http or https
    var response = await delete(uri, headers: getHeaders());
    Log.d(response.body);
    if (response.statusCode == 200) return response.body;

    return null;
  }
  /* Http Params */
  static Map<String, String> paramsEmpty() {
    Map<String, String> params = new Map();
    return params;
  }

  static Map<String, String> paramsCreate(Post post) {
    Map<String, String> params = new Map();
    params.addAll({
      'employee_name': post.employee_name!,
      'employee_age': post.employee_age.toString(),
      'employee_salary': post.employee_salary.toString(),
    });
    return params;
  }

  static Map<String, String> paramsUpdate(Post post) {
    Map<String, String> params = new Map();
    params.addAll({
      'profile_image': post.profile_image.toString(),
      'employee_name': post.employee_name!,
      'employee_salary': post.employee_salary.toString(),
      'employee_age': post.employee_age.toString(),
    });
    return params;
  }

}