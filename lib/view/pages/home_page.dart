import 'package:employee_management_dashboard/controller/auth_controller.dart';
import 'package:employee_management_dashboard/controller/employee_controller.dart';
import 'package:employee_management_dashboard/screens/desktop/desktop_layout.dart';
import 'package:employee_management_dashboard/screens/mobile_layout.dart';
import 'package:employee_management_dashboard/screens/tablet/tablet_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final AuthController authController = Get.find<AuthController>();
  final EmployeeController employeeController = Get.put(EmployeeController());
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    // print(size);
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 950) {
            return DesktopLayout();
          } else if (constraints.maxWidth > 600) {
            return TabletLayout();
          } else {
            return MobileLayout();
          }
        },
      ),
    );
  }
}
