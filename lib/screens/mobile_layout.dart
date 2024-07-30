import 'package:employee_management_dashboard/controller/employee_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileLayout extends StatelessWidget {
  MobileLayout({super.key});
  final EmployeeController employeeController = Get.put(EmployeeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (employeeController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (employeeController.employees.isEmpty) {
          return const Center(child: Text('No employees found'));
        }
        return ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: employeeController.employees.length,
          itemBuilder: (context, index) {
            final employee = employeeController.employees[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
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
                    style: const TextStyle(color: Colors.white, fontSize: 24),
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
                    Text(
                      'Salary: \$${employee.employeeSalary}',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.toNamed('/updateemployee', arguments: employee);
                      },
                      icon: const Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {
                        employeeController.deleteEmployee(employee.id);
                      },
                      icon: const Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/createemployee');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
