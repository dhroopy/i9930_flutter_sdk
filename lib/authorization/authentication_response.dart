import 'package:i9930_flutter_sdk/authorization/authentication_data.dart';
import 'package:i9930_flutter_sdk/response.dart';

class AuthenticationResponse extends Response<AuthenticationData> {
  AuthenticationResponse({super.statusCode, super.msg, super.data});

  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) {
    return AuthenticationResponse(
      statusCode: json["status_code"],
      msg: json["msg"],
      data: json["auth_details"],
    );
  }

  // @override
  // Response<AuthenticationData> fromJson(Map<String, dynamic> json) {
  //   return AuthenticationResponse(
  //     statusCode: json["status_code"],
  //     msg: json["msg"],
  //     data: json["auth_details"],
  //   );
  // }
}
