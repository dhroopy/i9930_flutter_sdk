import 'package:i9930_flutter_sdk/authorization/auth_details.dart';

class AuthDetails extends AuthenticationData {
  AuthDetails(
      {super.userId,
      super.accessToken,
      super.refreshToken,
      super.accessTokenExpiry,
      super.refreshTokenExpiry,
      super.lastLogin});

  @override
  AuthenticationData fromJson(Map<String, dynamic> json) {
    return AuthDetails(
        userId: json["user_id"].toString(),
        accessToken: json["access_token"].toString(),
        refreshToken: json["refresh_token"].toString(),
        accessTokenExpiry: json["access_token_expiry"].toString(),
        refreshTokenExpiry: json["refresh_token_expiry"].toString(),
        lastLogin: json["last_login"].toString());
  }

  @override
  Map toJson() {
    return {
      "user_id": userId,
      "access_token": accessToken,
      "refresh_token": refreshToken,
      "access_token_expiry": accessTokenExpiry,
      "refresh_token_expiry": refreshTokenExpiry,
      "last_login": lastLogin
    };
  }
}
