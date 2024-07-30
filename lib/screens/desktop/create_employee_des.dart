import 'package:employee_management_dashboard/controller/employee_controller.dart';
import 'package:employee_management_dashboard/model/employee_model.dart';
import 'package:employee_management_dashboard/view/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateEmployeePageDeskTop extends StatelessWidget {
  final EmployeeController employeeController = Get.find<EmployeeController>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();

  CreateEmployeePageDeskTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Employee'),
      ),
      body: Center(
        child: Container(
          width: 500,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'New Employee',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              MainTxtFeild(searchController: nameController, hinttxt: 'name'),
              const SizedBox(height: 20),
              TextField(
                controller: ageController,
                decoration: const InputDecoration(
                  labelText: 'Age',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: salaryController,
                decoration: const InputDecoration(
                  labelText: 'Salary',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  final String name = nameController.text;
                  final int age = int.tryParse(ageController.text) ?? 0;
                  final double salary =
                      double.tryParse(salaryController.text) ?? 0.0;

                  if (name.isNotEmpty && age > 0 && salary > 0) {
                    employeeController.createEmployee(Employee(
                        id: 99,
                        employeeName: name,
                        employeeAge: age,
                        employeeSalary: salary));
                    Get.back();
                  } else {
                    Get.snackbar('Error', 'Please fill all fields correctly');
                  }
                },
                child: const Text('Create Employee'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
