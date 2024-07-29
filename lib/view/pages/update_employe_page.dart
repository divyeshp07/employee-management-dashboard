import 'package:employee_management_dashboard/model/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:employee_management_dashboard/controller/employee_controller.dart';

class UpdateEmployeePage extends StatelessWidget {
  final EmployeeController employeeController = Get.find<EmployeeController>();
  final Employee employee;

  UpdateEmployeePage({super.key, required this.employee});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = employee.employeeName;
    ageController.text = employee.employeeAge.toString();
    salaryController.text = employee.employeeSalary.toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Employee'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: salaryController,
              decoration: const InputDecoration(labelText: 'Salary'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final String name = nameController.text;
                final int age = int.tryParse(ageController.text) ?? 0;
                final double salary =
                    double.tryParse(salaryController.text) ?? 0.0;

                if (name.isNotEmpty && age > 0 && salary > 0) {
                  final updatedEmployee = Employee(
                    id: employee.id,
                    employeeName: name,
                    employeeAge: age,
                    employeeSalary: salary,
                  );

                  employeeController.updateEmployee(updatedEmployee);
                  Get.back();
                } else {
                  Get.snackbar('Error', 'Please fill all fields correctly');
                }
              },
              child: const Text('Update Employee'),
            ),
          ],
        ),
      ),
    );
  }
}
