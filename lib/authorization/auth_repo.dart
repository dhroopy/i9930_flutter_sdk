import 'package:i9930_flutter_sdk/authorization/authentication_response.dart';

abstract class AuthRepo {
  Future<AuthenticationResponse> login({required Map request, required String endpoint});

  Future<bool> logout();

  Future<AuthenticationResponse> refreshToken({required Map request, required String endpoint});

}
