import 'package:employee_management_dashboard/controller/auth_controller.dart';
import 'package:employee_management_dashboard/controller/employee_controller.dart';
import 'package:employee_management_dashboard/view/widgets/slidebar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabletLayout extends StatelessWidget {
  TabletLayout({super.key});
  final AuthController authController = Get.find<AuthController>();

  final EmployeeController employeeController = Get.put(EmployeeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employees'),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('/search');
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              authController.signOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: SlideBarWidget(
              item1: 'Home',
              ontap1: () {},
              item2: 'Employees',
              ontap2: () {},
              item3: 'Settings',
              ontap3: () {},
            ),
          ),
          Expanded(
            flex: 3,
            child: Obx(() {
              if (employeeController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (employeeController.employees.isEmpty) {
                return const Center(child: Text('No employees found'));
              }
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                  itemCount: employeeController.employees.length,
                  itemBuilder: (context, index) {
                    final employee = employeeController.employees[index];
                    return Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.blueAccent,
                              child: Text(
                                employee.employeeName[0].toUpperCase(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 24),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              employee.employeeName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Age: ${employee.employeeAge}',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Salary: \$${employee.employeeSalary}',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Get.toNamed('/updateemployee',
                                        arguments: employee);
                                  },
                                  icon: const Icon(Icons.edit),
                                ),
                                IconButton(
                                  onPressed: () {
                                    employeeController
                                        .deleteEmployee(employee.id);
                                  },
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Get.toNamed('/createemployeedesk');
          },
          label: Text('Add New employee')),
    );
  }
}
