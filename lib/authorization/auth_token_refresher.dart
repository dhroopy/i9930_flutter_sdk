import 'package:i9930_flutter_sdk/authorization/authorization.dart';

import '../env/env.dart';
import 'http_auth_datasource.dart';

abstract class AuthTokenRefresher {
  Future<AuthenticationResponse> refreshToken(
      {required AuthenticationData authInfo});
}

class ApiTokenRefresher extends AuthTokenRefresher {
  AuthRepo? authRepoImpl;
  ApiTokenRefresher({this.authRepoImpl});

  @override
  Future<AuthenticationResponse> refreshToken(
      {required AuthenticationData authInfo}) async {

    assert(I9930Sdk.env != null);
    assert(I9930Sdk.env!.refreshTokenEndpoint != null);
    assert(I9930Sdk.env!.refreshTokenEndpoint!.isNotEmpty);

    authRepoImpl ??= AuthRepoImpl(dataSource: HttpAuthDataSource());

    Map request = {};

    request["refresh_token"] = authInfo.refreshToken;

    return authRepoImpl!.refreshToken(
        request: request,
        endpoint: I9930Sdk.env!.refreshTokenEndpoint.toString());
  }
}
