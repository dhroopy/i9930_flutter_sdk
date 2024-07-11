// import 'package:connectivity_plus/connectivity_plus.dart' as cp;

abstract class Connectivity {
  bool isConnected();
}

class InternetConnectivity extends Connectivity {
  bool _isConnected = true;

  // InternetConnectivity() {
  //   cp.Connectivity().onConnectivityChanged.listen((result) {
  //     _updateConnectivityStatus(result);
  //   });
  // }

  @override
  bool isConnected() {
    return _isConnected;
  }

  // void _updateConnectivityStatus(cp.ConnectivityResult result) {
  //   _isConnected = result != cp.ConnectivityResult.none;
  // }
}
