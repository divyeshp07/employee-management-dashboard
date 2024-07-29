import 'dart:convert';
import 'package:employee_management_dashboard/model/employee_model.dart';
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

// creating employee
// TODO
  Future<void> createEmployee(Employee employee) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/employees'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(employee.toJson()),
      );
      if (response.statusCode != 201) {
        print(response.body);
        throw Exception('failed to create employee');
      }
    } catch (e) {
      throw Exception('error creating employee $e');
    }
  }

// UPDATTE EMPLOYEE
// TODO
  Future<void> updateEmployee(Employee employee) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/employees/${employee.id}'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(employee.toJson()),
      );
      if (response.statusCode != 200) {
        throw Exception('failed to update employee');
      }
    } catch (e) {
      throw Exception('error updating employee $e');
    }
  }

// Delete employe
  Future<void> deleteEmployee(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/employees/$id'));
    if (response.statusCode != 200) {
      throw Exception('failed to delete employee');
    }
  }
}
