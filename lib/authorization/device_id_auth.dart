import 'package:i9930_flutter_sdk/authorization/authorization.dart';
import 'package:i9930_flutter_sdk/env/env.dart';

import 'http_auth_datasource.dart';

class DeviceIdAuth extends Auth {
  AuthRepo? authRepoImpl;

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
