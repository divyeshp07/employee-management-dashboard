import 'package:employee_management_dashboard/binding.dart';
import 'package:employee_management_dashboard/firebase_options.dart';
import 'package:employee_management_dashboard/view/pages/create_employee_page.dart';
import 'package:employee_management_dashboard/view/pages/home_page.dart';
import 'package:employee_management_dashboard/view/pages/login_page.dart';
import 'package:employee_management_dashboard/view/pages/search_page.dart';
import 'package:employee_management_dashboard/view/pages/signup_page.dart';
import 'package:employee_management_dashboard/view/pages/update_employe_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Employee Management Dashboard',
      theme: ThemeData.dark(),
      initialBinding: AppBindings(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => LoginPage()),
        GetPage(name: '/signup', page: () => SignUpPage()),
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/search', page: () => SearchPage()),
        GetPage(name: '/createemployee', page: () => CreateEmployeePage()),
        GetPage(
            name: '/updateemployee',
            page: () => UpdateEmployeePage(employee: Get.arguments)),
      ],
    );
  }
}
