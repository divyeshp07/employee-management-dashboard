import 'package:employee_management_dashboard/model/employee_model.dart';
import 'package:employee_management_dashboard/view/widgets/maintxtfeild_widget.dart';
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Create Employeee'),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return desktopLayout(context);
            } else if (constraints.maxWidth > 600) {
              return tabletLayout(context);
            } else {
              return mobileLayout(context);
            }
          },
        ),
      ),
    );
  }

  Widget desktopLayout(BuildContext context) {
    return Container(
      width: 800,
      padding: const EdgeInsets.all(32.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          const BoxShadow(
            color: Colors.white12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
        color: Colors.grey[900],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Create New Employee',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          MainTxtFeild(
            controller: nameController,
            hinttxt: 'Name',
          ),
          const SizedBox(height: 20),
          MainTxtFeild(
            controller: ageController,
            hinttxt: 'Age',
            textInputType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          MainTxtFeild(
            controller: salaryController,
            hinttxt: 'Salary',
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
                Get.snackbar('Error', 'Please check the fields');
              }
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              textStyle: const TextStyle(fontSize: 16),
            ),
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }

  Widget tabletLayout(BuildContext context) {
    return Container(
      width: 600,
      padding: const EdgeInsets.all(32.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          const BoxShadow(
            color: Colors.white12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
        color: Colors.grey[900],
      ),
      child: Column(
        children: [
          const Text(
            'Create New Employee',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          MainTxtFeild(
            controller: nameController,
            hinttxt: 'Name',
          ),
          const SizedBox(height: 20),
          MainTxtFeild(
            controller: ageController,
            hinttxt: 'Age',
            textInputType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          MainTxtFeild(
            controller: salaryController,
            hinttxt: 'Salary',
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
                Get.snackbar('Error', 'Please check the fields');
              }
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              textStyle: const TextStyle(fontSize: 16),
            ),
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }

  Widget mobileLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Create New Employee',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          MainTxtFeild(
            controller: nameController,
            hinttxt: 'Name',
          ),
          const SizedBox(height: 20),
          MainTxtFeild(
            controller: ageController,
            hinttxt: 'Age',
            textInputType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          MainTxtFeild(
            controller: salaryController,
            hinttxt: 'Salary',
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
                Get.snackbar('Error', 'Please check the fields');
              }
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              textStyle: const TextStyle(fontSize: 16),
            ),
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }
}
