import 'package:i9930_flutter_sdk/authorization/auth_repo_impl.dart';
import 'package:i9930_flutter_sdk/authorization/authentication_response.dart';
import 'package:i9930_flutter_sdk/env/env.dart';

import 'auth.dart';
import 'auth_request.dart';
import 'http_auth_datasource.dart';

class DeviceIdAuth extends Auth {
  AuthRepoImpl? authRepoImpl;

  DeviceIdAuth({
    this.authRepoImpl,
  });

  @override
  Future<AuthenticationResponse> login({required AuthParam authParam}) async {
    assert(I9930Sdk.env != null);

    authRepoImpl ??= AuthRepoImpl(dataSource: HttpAuthDataSource());

    Map data = {};
    data["email"] = authParam.userContactInfo;
    data["password"] = authParam.deviceId;
    if (authParam.otp != null) {
      data["otp"] = authParam.otp;
    }
    return await authRepoImpl!
        .login(request: data, endpoint: I9930Sdk.env!.authEndpoint.toString());
  }
}
