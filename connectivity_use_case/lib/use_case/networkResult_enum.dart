import 'package:connectivity_plus/connectivity_plus.dart';

enum NetWorkResultEnum {
  on,
  off;

  static NetWorkResultEnum checkConnectivityResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.bluetooth:
      case ConnectivityResult.wifi:
      case ConnectivityResult.ethernet:
      case ConnectivityResult.mobile:
        return NetWorkResultEnum.on;
      case ConnectivityResult.none:
        return NetWorkResultEnum.off;
    }
  }
}
