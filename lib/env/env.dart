import 'package:i9930_flutter_sdk/env/base_url.dart';

class I9930Sdk {
  static SdkEnv? env;

  static void init({SdkEnv? env}) {
    I9930Sdk.env = env;
  }
}

class SdkEnv {
  BaseUrl? url;
  String? authEndpoint;
  String? refreshTokenEndpoint;
  String? mediaUploadEndpoint;
  String? generateUrlEndpoint;

  SdkEnv(
      {this.url,
      this.authEndpoint,
      this.refreshTokenEndpoint,
      this.mediaUploadEndpoint,
      this.generateUrlEndpoint});
}
