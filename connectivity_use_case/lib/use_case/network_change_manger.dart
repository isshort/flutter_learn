import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:connectivity_use_case/use_case/networkResult_enum.dart';

typedef NetworkCallBack = void Function(NetWorkResultEnum resultEnum);

abstract class INetworkChangeManger {
  void handleNetworkChange(NetworkCallBack onChange);
  void dispose();
}

class NetWorkChangeManger extends INetworkChangeManger {
  late final Connectivity _connectivity;
  StreamSubscription<ConnectivityResult>? _subscription;

  NetWorkChangeManger() {
    _connectivity = Connectivity();
  }

  @override
  void dispose() {
    _subscription?.cancel();
  }

  @override
  void handleNetworkChange(NetworkCallBack onChange) {
    _subscription = _connectivity.onConnectivityChanged.listen((event) {
      // print(event);
      onChange.call(NetWorkResultEnum.checkConnectivityResult(event));
    });
  }
}
