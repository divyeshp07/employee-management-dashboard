import 'package:employee_management_dashboard/core/exceptions/base_exception.dart';

class SignUpException extends BaseException {
  final String code;
  SignUpException(this.code, super.message);
}
