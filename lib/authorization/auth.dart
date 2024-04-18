import 'package:i9930_flutter_sdk/authorization/authentication_response.dart';

abstract class Auth {
  Future<AuthenticationResponse> login();
}



