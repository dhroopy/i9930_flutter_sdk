class AuthParam {
  String? userContactInfo;
  String? otp;
  String? deviceId;
  String? apiKey;
  Map? extra;

  AuthParam(
      {required this.userContactInfo,
      required this.deviceId,
      this.otp,
      this.apiKey,
      this.extra});
}
