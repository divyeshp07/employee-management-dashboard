import 'package:employee_management_dashboard/controller/employee_controller.dart';
import 'package:employee_management_dashboard/view/widgets/maintxtfeild_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  final EmployeeController employeeController = Get.find<EmployeeController>();
  final TextEditingController searchController = TextEditingController();

  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Search Employee'),
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
          BoxShadow(
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
          MainTxtFeild(
            controller: searchController,
            hinttxt: 'Enter ID',
            textInputType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              final String idText = searchController.text;
              if (idText.isNotEmpty) {
                employeeController.fetchEmployeeByid(int.parse(idText));
              }
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            child: const Text('Search'),
          ),
          const SizedBox(height: 20),
          Obx(() {
            if (employeeController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            final id = int.tryParse(searchController.text);
            final employee = employeeController.employees
                .firstWhereOrNull((e) => e.id == id);

            if (employee == null) {
              return const Center(
                  child: Text('No employee found.',
                      style: TextStyle(color: Colors.white70)));
            }

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                color: Colors.grey[800],
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
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Age: ${employee.employeeAge}',
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                      Text(
                        'Salary: ${employee.employeeSalary}',
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
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
          BoxShadow(
            color: Colors.white12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
        color: Colors.grey[900],
      ),
      child: Column(
        children: [
          MainTxtFeild(
            controller: searchController,
            hinttxt: 'Enter ID',
            textInputType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              final String idText = searchController.text;
              if (idText.isNotEmpty) {
                employeeController.fetchEmployeeByid(int.parse(idText));
              }
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            child: const Text('Search'),
          ),
          const SizedBox(height: 20),
          Obx(() {
            if (employeeController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            final id = int.tryParse(searchController.text);
            final employee = employeeController.employees
                .firstWhereOrNull((e) => e.id == id);

            if (employee == null) {
              return const Center(
                  child: Text('No employee found.',
                      style: TextStyle(color: Colors.white70)));
            }

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                color: Colors.grey[800],
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
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Age: ${employee.employeeAge}',
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                      Text(
                        'Salary: ${employee.employeeSalary}',
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
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
          MainTxtFeild(
            controller: searchController,
            hinttxt: 'Enter ID',
            textInputType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              final String idText = searchController.text;
              if (idText.isNotEmpty) {
                employeeController.fetchEmployeeByid(int.parse(idText));
              }
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            ),
            child: const Text('Search'),
          ),
          const SizedBox(height: 20),
          Obx(() {
            if (employeeController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            final id = int.tryParse(searchController.text);
            final employee = employeeController.employees
                .firstWhereOrNull((e) => e.id == id);

            if (employee == null) {
              return const Center(
                  child: Text('No employee found.',
                      style: TextStyle(color: Colors.white70)));
            }

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                color: Colors.grey[800],
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
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Age: ${employee.employeeAge}',
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                      Text(
                        'Salary: ${employee.employeeSalary}',
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
