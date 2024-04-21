import 'package:i9930_flutter_sdk/authorization/auth_token_refresher.dart';
import 'package:i9930_flutter_sdk/authorization/authorization.dart';
import 'device_id_auth.dart';

class I9930AuthService {
  static late Auth auth;
  static late AuthTokenRefresher tokenRefresher;

  static Future<void> authWithDeviceId(
      {required AuthParam authParam,
      required Function(AuthenticationResponse) onSuccess,
      required Function(int, String) onFaiulure,
      required Function(String) onOtpSent,
      required Function(Object error) onError}) async {
    auth = DeviceIdAuth();
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

  static Future<AuthenticationResponse?> refreshToken({
    required AuthenticationData authInfo,
    Function(AuthenticationResponse)? onSuccess,
    Function(int, String)? onFaiulure,
  }) async {
    tokenRefresher = ApiTokenRefresher();
    AuthenticationResponse? response;
    await tokenRefresher
        .refreshToken(authInfo: authInfo)
        .then((updateAuthData) {
      if (updateAuthData.statusCode == 0) {
        if (onSuccess != null) {
          onSuccess(updateAuthData);
        }
        response = updateAuthData;
      } else {
        //Any other error or failure.
        if (onFaiulure != null) {
          onFaiulure(updateAuthData.statusCode!, updateAuthData.msg.toString());
        }
        response = null;
      }
    }).onError((error, stackTrace) {
      if (onFaiulure != null) {
        onFaiulure(500, error.toString());
        response = null;
      }
    });
    return response;
  }
}
