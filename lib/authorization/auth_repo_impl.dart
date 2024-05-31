import 'package:i9930_flutter_sdk/authorization/auth_datasource.dart';
import 'package:i9930_flutter_sdk/authorization/auth_repo.dart';
import 'package:i9930_flutter_sdk/authorization/authentication_response.dart';

class AuthRepoImpl extends AuthRepo {
  AuthDataSource dataSource;
  AuthRepoImpl({required this.dataSource});

  @override
  Future<AuthenticationResponse> login(
      {required Map request, required String endpoint}) async {
    return AuthenticationResponse.fromJson(
        await dataSource.post(requestFields: request, endpoint: endpoint));
  }

  @override
  Future<bool> logout() {
    throw UnimplementedError();
  }

  @override
  Future<AuthenticationResponse> refreshToken(
      {required Map request, required String endpoint}) async {
    return AuthenticationResponse.fromJson(
        await dataSource.post(requestFields: request, endpoint: endpoint));
  }
}
