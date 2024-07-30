import 'package:employee_management_dashboard/controller/auth_controller.dart';
import 'package:employee_management_dashboard/controller/employee_controller.dart';
import 'package:employee_management_dashboard/view/widgets/slidebar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final EmployeeController employeeController = Get.put(EmployeeController());
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Add your search logic here
              Get.toNamed('/search');
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              authController.signOut();
            },
          ),
        ],
      ),
      body: Obx(() {
        if (employeeController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (employeeController.employees.isEmpty) {
          return const Center(
              child: Text('No employees found',
                  style: TextStyle(color: Colors.white)));
        }
        return LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 1200) {
              return desktopLayout(context);
            } else if (constraints.maxWidth > 800) {
              return tabletLayout(context);
            } else {
              return mobileLayout(context);
            }
          },
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          Get.toNamed('/createemployee');
        },
        child: Icon(Icons.add),
      ),
    );
  }

// Desktop
  Widget desktopLayout(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 300,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.blueGrey[800],
            borderRadius: BorderRadius.circular(12),
          ),
          child: SlideBarWidget(
            item1: 'Profile',
            ontap1: () {},
            item2: 'Leave Requests',
            ontap2: () {},
            item3: 'Add New Employee',
            ontap3: () {
              Get.toNamed('/createemployee');
            },
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Employee Management Dashboard',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                    ),
                    itemCount: employeeController.employees.length,
                    itemBuilder: (context, index) {
                      final employee = employeeController.employees[index];
                      return Card(
                        color: Colors.blueGrey[700],
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
                                backgroundColor: Colors.cyanAccent,
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
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Age: ${employee.employeeAge}',
                                style: const TextStyle(color: Colors.white70),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Salary: \$${employee.employeeSalary}',
                                style: const TextStyle(color: Colors.white70),
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
                                    icon: const Icon(Icons.edit,
                                        color: Colors.cyanAccent),
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
  }

// tab
  Widget tabletLayout(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 250,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.blueGrey[800],
            borderRadius: BorderRadius.circular(12),
          ),
          child: SlideBarWidget(
            item1: 'Profile',
            ontap1: () {},
            item2: 'Leave Requests',
            ontap2: () {},
            item3: 'Add New Employee',
            ontap3: () {
              Get.toNamed('/createemployee');
            },
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Employee Management Dashboard',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                    ),
                    itemCount: employeeController.employees.length,
                    itemBuilder: (context, index) {
                      final employee = employeeController.employees[index];
                      return Card(
                        color: Colors.blueGrey[700],
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
                                backgroundColor: Colors.cyanAccent,
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
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Age: ${employee.employeeAge}',
                                style: const TextStyle(color: Colors.white70),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Salary: \$${employee.employeeSalary}',
                                style: const TextStyle(color: Colors.white70),
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
                                    icon: const Icon(Icons.edit,
                                        color: Colors.cyanAccent),
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
  }

// mobile
  Widget mobileLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text(
            'Employee Dashboard',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: employeeController.employees.length,
              itemBuilder: (context, index) {
                final employee = employeeController.employees[index];
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.blueAccent,
                      child: Text(
                        employee.employeeName[0].toUpperCase(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                    title: Text(
                      employee.employeeName,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Text(
                      'Age: ${employee.employeeAge}\nSalary: \$${employee.employeeSalary}',
                      style: TextStyle(color: Colors.grey[600]),
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
            ),
          ),
        ],
      ),
    );
  }
}
