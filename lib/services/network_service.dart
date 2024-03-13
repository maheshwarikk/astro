import 'dart:convert';

import 'package:http/http.dart';
import 'package:india_today/model/astro_response.dart';
import 'package:india_today/model/panchang_response.dart';
import 'package:india_today/services/api_service.dart';
import 'package:india_today/utils/url.dart';

class NetworkService {
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static Future<Astro> fetchAllAgents() async {
    final response = await ApiService.makeRequest(
        Url.FETCH_ALL_AGENTS, RequestType.get, null, null);

    Map<String, dynamic> jsonMap = ApiService.handleResponse(response?.body);

    return Astro.fromJson(jsonMap);
  }

  static Future fetchAllLocations(Map<String, dynamic> request) async {
    final Response? response = await ApiService.makeRequest(
        Url.FETCH_ALL_LOCATIONS, RequestType.get, request, null);

    String? jsonString = response?.body;
    if (jsonString == null) return null;

    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return jsonMap;
  }

  static Future<Panchang> fetchAllPanchangs(
      Map<String, dynamic> request) async {
    final Response? response = await ApiService.makeRequest(
        Url.FETCH_ALL_PANCHANG, RequestType.post, request, headers);

    Map<String, dynamic> jsonMap = ApiService.handleResponse(response?.body);

    return Panchang.fromJson(jsonMap);
  }
}
