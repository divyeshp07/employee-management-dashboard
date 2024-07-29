import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:employee_management_dashboard/controller/employee_controller.dart';

class SearchPage extends StatelessWidget {
  final EmployeeController employeeController = Get.find<EmployeeController>();
  final TextEditingController searchController = TextEditingController();

  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search Employee'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              TextField(
                controller: searchController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Enter ID',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () async {
                    final String idText = searchController.text;
                    if (idText.isNotEmpty) {
                      employeeController.fetchEmployeeByid(int.parse(idText));
                    }
                  },
                  child: const Text('search')),
              const SizedBox(height: 20),
              Obx(() {
                if (employeeController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                final id = int.tryParse(searchController.text);
                final employee = employeeController.employees
                    .firstWhereOrNull((e) => e.id == id);

                if (employee == null) {
                  return const Center(child: Text('no employee found .'));
                }

                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16.0),
                      leading: CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        child: Text(
                          employee.employeeName[0].toUpperCase(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 24),
                        ),
                      ),
                      title: Text(
                        employee.employeeName,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Age: ${employee.employeeAge}',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          Text('Salary: ${employee.employeeSalary}',
                              style: TextStyle(color: Colors.grey[600])),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ])));
  }
}
