import 'package:employee_management_dashboard/controller/employee_controller.dart';
import 'package:employee_management_dashboard/view/widgets/slidebar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DesktopLayout extends StatelessWidget {
  DesktopLayout({super.key});
  final EmployeeController employeeController = Get.put(EmployeeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber,
        body: Obx(() {
          if (employeeController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          if (employeeController.employees.isEmpty) {
            return const Center(child: Text('No employees '));
          }
          return Row(
            children: [
              Container(
                width: 250,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.blueGrey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SlideBarWidget(
                  item1: 'profile',
                  ontap1: () {},
                  item2: 'leave requestes',
                  ontap2: () {},
                  item3: 'add new employe',
                  ontap3: () {
                    Get.toNamed('/createemployeedesk');
                  },
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Text(
                        'Employee Management Dashboard',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 16.0,
                            mainAxisSpacing: 16.0,
                          ),
                          itemCount: employeeController.employees.length,
                          itemBuilder: (context, index) {
                            final employee =
                                employeeController.employees[index];
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
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }));
  }
}
