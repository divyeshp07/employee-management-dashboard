import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // base ul
  final String baseUrl = "https://dummy.restapiexample.com/api/v1";

// fetching the employes
  Future<List<dynamic>> fetchEmployees() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/employees'));

      if (response.statusCode == 200) {
        return json.decode(response.body)['data'];
      } else {
        throw Exception('failed to load employees');
      }
    } catch (e) {
      throw Exception('failed load employees: ${e.toString()}');
    }
  }

// employee fetching by id
  Future<Map<String, dynamic>> fetchEmployeeByid(int id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/employee/$id'));

      if (response.statusCode == 200) {
        return json.decode(response.body)['data'];
      } else {
        throw Exception('failed to load employee');
      }
    } catch (e) {
      throw Exception('failed to load employee${e.toString()}');
    }
  }
}
