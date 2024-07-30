import 'package:employee_management_dashboard/model/employee_model.dart';
import 'package:employee_management_dashboard/view/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:employee_management_dashboard/controller/employee_controller.dart';

class CreateEmployeePage extends StatelessWidget {
  final EmployeeController employeeController = Get.put(EmployeeController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();

  CreateEmployeePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Employee'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            MainTxtFeild(searchController: nameController, hinttxt: 'name'),
            const SizedBox(height: 20),
            MainTxtFeild(
              searchController: ageController,
              hinttxt: 'age',
              textInputType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            MainTxtFeild(
              searchController: salaryController,
              hinttxt: 'salary',
              textInputType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final String name = nameController.text;
                final int age = int.tryParse(ageController.text) ?? 0;
                final int salary = int.tryParse(salaryController.text) ?? 0;

                if (name.isNotEmpty && age > 0 && salary > 0) {
                  final newEmployee = Employee(
                    id: 55,
                    employeeName: name,
                    employeeAge: age,
                    employeeSalary: salary.toDouble(),
                  );
                  employeeController.createEmployee(newEmployee);
                  Get.back();
                } else {
                  Get.snackbar('error', 'please check the feilds');
                }
              },
              child: const Text('Create'),
            ),
          ],
        ),
      ),
    );
  }
}
