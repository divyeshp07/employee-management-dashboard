// class Employee {
//   int id;
//   String employeeName;
//   int employeeAge;
//   double employeeSalary;

//   Employee({
//     required this.id,
//     required this.employeeName,
//     required this.employeeAge,
//     required this.employeeSalary,
//   });

//   factory Employee.fromJson(Map<String, dynamic> json) {
//     return Employee(
//       id: json['id'],
//       employeeName: json['employee_name'],
//       employeeAge: json['employee_age'],
//       employeeSalary: json['employee_salary'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'employee_name': employeeName,
//       'employee_age': employeeAge,
//       'employee_salary': employeeSalary.toDouble(),
//     };
//   }
// }
class Employee {
  final int id;
  final String employeeName;
  final int employeeAge;
  final double employeeSalary;

  Employee({
    required this.id,
    required this.employeeName,
    required this.employeeAge,
    required this.employeeSalary,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      employeeName: json['employee_name'],
      employeeAge: json['employee_age'],
      employeeSalary: json['employee_salary'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'employee_name': employeeName,
      'employee_age': employeeAge,
      'employee_salary': employeeSalary,
    };
  }
}
