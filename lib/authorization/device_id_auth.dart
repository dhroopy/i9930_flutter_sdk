import 'package:i9930_flutter_sdk/authorization/auth_repo_impl.dart';
import 'package:i9930_flutter_sdk/authorization/authentication_response.dart';
import 'package:i9930_flutter_sdk/env/env.dart';

import 'auth.dart';
import 'auth_request.dart';

class DeviceIdAuth extends Auth {
  AuthParam param;
  AuthRepoImpl authRepoImpl;

  DeviceIdAuth({
    required this.param,
    required this.authRepoImpl,
  });

  @override
  Future<AuthenticationResponse> login() async {
    assert(I9930Sdk.env != null);
    Map data = {};
    data["email"] = param.userContactInfo;
    data["password"] = param.deviceId;
    if (param.otp != null) {
      data["otp"] = param.otp;
    }
    return await authRepoImpl.login(request: data, endpoint: I9930Sdk.env!.authEndpoint.toString());
  }
}
