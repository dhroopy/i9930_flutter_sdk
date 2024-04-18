import 'package:i9930_flutter_sdk/authorization/auth_request.dart';
import 'package:i9930_flutter_sdk/authorization/authentication_response.dart';

abstract class Auth {
  Future<AuthenticationResponse> login({required AuthParam authParam});
}



