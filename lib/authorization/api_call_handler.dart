import 'package:i9930_flutter_sdk/connectivity.dart';
import 'package:i9930_flutter_sdk/authorization/authorization.dart';
import 'package:i9930_flutter_sdk/dialog/app_dialog.dart';
import 'package:i9930_flutter_sdk/logger/logger.dart';

class ApiCallHandler {
  int retryLimit;
  AuthenticationData? authInfo;
  Connectivity? nwtMngr;
  TokenManager? tokenMngr;
  AppDialog? dialog;
  Logger? appLogger;
  int _timesRetried = 0;

  ApiCallHandler(
      {this.retryLimit = 1,
      this.authInfo,
      this.nwtMngr,
      this.tokenMngr,
      this.dialog,
      this.appLogger});

  void makeApiCall(
      {required Future<void> Function() apiCall,
      required Future<void> Function(AuthenticationData?)
          onTokensRefreshed}) async {
    bool authVerified = false;
    nwtMngr ??= InternetConnectivity();
    tokenMngr ??= AuthTokenManager();

    if (!nwtMngr!.isConnected()) {
      //Show not connected dialog..
      dialog?.showAppDialog();
      InfoLogger(message: "No Internet Connection Available.").log();
      return;
    }

    authVerified = authInfo == null
        ? true
        : await tokenMngr!.isTokenExpired(authInfo: authInfo!);

    if (!authVerified) {
      //Calling refresh token api
      AuthenticationResponse? authResponse =
          await I9930AuthService.refreshToken(authInfo: authInfo!);
      if (authResponse == null) {
        //access token and refresh token both expired
        //logout and
        dialog?.showAppDialog();
        InfoLogger(message: "Authorization expired! Please Logout.").log();
        return;
      }
      onTokensRefreshed(authResponse.data);
    }

    await apiCall().onError((error, stackTrace) {
      InfoLogger(message: "onError ${error.toString()}").log();
      if (retryLimit > _timesRetried) {
        _timesRetried++;
        InfoLogger(message: "Retrying $_timesRetried times").log();
        apiCall();
      }
    });
  }
}
