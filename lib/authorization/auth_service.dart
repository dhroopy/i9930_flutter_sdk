import 'package:i9930_flutter_sdk/authorization/auth_request.dart';
import 'package:i9930_flutter_sdk/authorization/authentication_response.dart';

import 'auth.dart';
import 'device_id_auth.dart';

class I9930AuthService {
  late Auth auth;

  static Future<void> authWithDeviceId(
      {required AuthParam authParam,
      required Function(AuthenticationResponse) onSuccess,
      required Function(int, String) onFaiulure,
      required Function(String) onOtpSent,
      required Function(Object error) onError}) async {
    
    Auth auth = DeviceIdAuth();
    await auth.login(authParam: authParam).then((loginResponse) {
      if (loginResponse.statusCode == 0) {
        onSuccess(loginResponse);
      } else if (loginResponse.statusCode == 1) {
        //Registered and otp verification
        onOtpSent(loginResponse.msg.toString());
      } else if (loginResponse.statusCode == 2) {
        //Device changed otp verification
        onOtpSent(loginResponse.msg.toString());
      } else if (loginResponse.statusCode == 3) {
        //Invalid OTP and resent OTP
        onOtpSent(loginResponse.msg.toString());
      } else if (loginResponse.statusCode == 4) {
      } else {
        //Any other error or failure.
        onFaiulure(loginResponse.statusCode!, loginResponse.msg.toString());
      }
    }).onError((error, stackTrace) {
      onError(error!);
    });
  }
}
