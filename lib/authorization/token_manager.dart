import 'package:i9930_flutter_sdk/authorization/authentication_data.dart';
import 'package:i9930_flutter_sdk/authorization/authorization.dart';

abstract class TokenManager {
  Future<bool> isTokenExpired({required AuthenticationData authInfo});
}

class AuthTokenManager extends TokenManager {
  @override
  Future<bool> isTokenExpired({required AuthenticationData authInfo}) async {
    
    bool isRefreshNeeded = _isRefreshingNeeded(authInfo);
    return isRefreshNeeded;
    
  }

  bool _isRefreshingNeeded(AuthenticationData authInfo) {
    return DateTime.now()
          .difference(DateTime.parse(authInfo.oldTimestamp!))
          .inMinutes >
      int.parse(authInfo.accessTokenExpiry!);
  }
}
