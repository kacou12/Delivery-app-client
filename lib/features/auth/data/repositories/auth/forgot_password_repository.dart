import 'package:woudy_customers_app/core/utils/typedefs.dart';

abstract class ForgotPasswordRepository {
  FutureResult<Map<String, String>> sendPasswordReset(String email);
  FutureResult<bool> verifyResetCode(String code);
  FutureResult<bool> resetPassword(String newPassword, String confirmPassword);
}
