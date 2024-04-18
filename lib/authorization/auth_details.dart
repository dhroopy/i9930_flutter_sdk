abstract class AuthenticationData {
  String? userId;
  String? accessToken;
  String? refreshToken;
  String? accessTokenExpiry;
  String? refreshTokenExpiry;
  String? lastLogin;

  AuthenticationData(
      {
        this.userId,
      this.accessToken,
      this.refreshToken,
      this.accessTokenExpiry,
      this.refreshTokenExpiry,
      this.lastLogin});

  AuthenticationData fromJson(Map<String, dynamic> json);

  Map toJson();
}
