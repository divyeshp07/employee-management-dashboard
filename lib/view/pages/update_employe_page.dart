import 'package:employee_management_dashboard/model/employee_model.dart';
import 'package:employee_management_dashboard/view/widgets/maintxtfeild_widget.dart';
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
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text('Update Employee'),
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
            color: Colors.black54,
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
            'Update Employee Details',
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
              _updateEmployee();
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              textStyle: const TextStyle(fontSize: 16),
            ),
            child: const Text('Update'),
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
            color: Colors.black54,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
        color: Colors.grey[900],
      ),
      child: Column(
        children: [
          const Text(
            'Update Employee Details',
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
              _updateEmployee();
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              textStyle: const TextStyle(fontSize: 16),
            ),
            child: const Text('Update'),
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
            'Update Employee Details',
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
              _updateEmployee();
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              textStyle: const TextStyle(fontSize: 16),
            ),
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }

  void _updateEmployee() {
    final String name = nameController.text;
    final int age = int.tryParse(ageController.text) ?? 0;
    final double salary = double.tryParse(salaryController.text) ?? 0.0;

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
  }
}
