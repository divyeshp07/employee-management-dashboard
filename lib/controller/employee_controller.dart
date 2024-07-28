import 'package:employee_management_dashboard/model/employee_model.dart';
import 'package:employee_management_dashboard/service/api_services.dart';
import 'package:get/get.dart';

class EmployeeController extends GetxController {
  var employees = <Employee>[].obs;
  var isLoading = true.obs;

  final ApiService apiService = ApiService();

  @override
  void onInit() {
    fetchEmployees();
    super.onInit();
  }

  void fetchEmployees() async {
    try {
      isLoading(true);
      var employeeList = await apiService.fetchEmployees();
      employees.assignAll(
          employeeList.map((data) => Employee.fromJson(data)).toList());
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
