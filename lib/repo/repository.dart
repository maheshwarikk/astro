import 'package:india_today/model/astro_response.dart';
import 'package:india_today/model/panchang_response.dart';
import 'package:india_today/services/network_service.dart';

class Repository {
  Future<Astro> getAllAgents() => NetworkService.fetchAllAgents();

  Future<Panchang> getAllPanchangs(Map<String, dynamic> request) =>
      NetworkService.fetchAllPanchangs(request);
}
