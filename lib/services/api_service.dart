import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

enum RequestType { get, post, put }

class ApiService {
  static bool showLog = true;
  static bool showColorLog = true;

  static Future<Response?> makeRequest(
    String url,
    RequestType requestType,
    dynamic parameter,
    dynamic headers,
  ) async {
    var client = http.Client();
    switch (requestType) {
      case RequestType.get:
        try {
          String queryString = Uri(queryParameters: parameter).query;
          final Response response = await client.get(
            Uri.parse('$url?$queryString'),
            headers: headers,
          );
          printLog("GET", url, headers, parameter, response);
          if (response.statusCode == 200) {
            return response;
          } else {
            throw Exception(response.statusCode);
          }
        } catch (e) {
          log("$url : $e");
        }
        break;

      case RequestType.post:
        try {
          final Response response = await client.post(
            Uri.parse(url),
            headers: headers,
            body: jsonEncode(parameter),
          );

          printLog("POST", url, headers, parameter, response);
          if (response.statusCode == 200) {
            return response;
          } else {
            throw Exception(response.statusCode);
          }
        } catch (e) {
          log("$url : $e");
        }
        break;

      case RequestType.put:
        try {
          final Response response = await client.put(
            Uri.parse(url),
            headers: headers,
            body: jsonEncode(parameter),
          );

          printLog("PUT", url, headers, parameter, response);
          if (response.statusCode == 200) {
            return response;
          } else {
            throw Exception(response.statusCode);
          }
        } catch (e) {
          log("$url : $e");
        }
        break;
      default:
        return throw Exception("The HTTP request method is not found");
    }
  }

  static Map<String, dynamic> handleResponse(String? jsonString) {
    Map<String, dynamic> errorCodeNotFound = {"success": false};
    Map<String, dynamic> jsonMap;
    if (jsonString == null) {
      return errorCodeNotFound;
    }
    jsonMap = json.decode(jsonString);
    return jsonMap;
  }

  static printLog(type, url, headers, parameter, response) {
    if (showLog) {
      if (showColorLog) {
        logApi("$type", url, headers, parameter, response);
      } else {
        log("[$type] $url \nHeaders: $headers \nRequest: ${jsonEncode(parameter).toString()}\nResponse: ${response.body}");
      }
    }
  }

  static logApi(
    dynamic type,
    String url,
    dynamic headers,
    dynamic parameter,
    dynamic response,
  ) {
    log("\x1B[35m[$type] $url\x1B[0m \x1B[34m\nHeaders: $headers\x1B[0m  \x1B[36m\nRequest: ${jsonEncode(parameter).toString()}\n\x1B[0m Response: ${response.body}");
  }
}
