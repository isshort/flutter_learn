import 'package:connectivity_use_case/use_case/networkResult_enum.dart';
import 'package:connectivity_use_case/use_case/network_change_manger.dart';
import 'package:flutter/material.dart';

class NetWorkWidget extends StatefulWidget {
  const NetWorkWidget({super.key});

  @override
  State<NetWorkWidget> createState() => _NetWorkWidgetState();
}

class _NetWorkWidgetState extends State<NetWorkWidget> with StateMixin {
  late final INetworkChangeManger _iNetworkChangeManger;
  NetWorkResultEnum? _netWorkResultEnum;

  @override
  void initState() {
    super.initState();
    _iNetworkChangeManger = NetWorkChangeManger();
    waitForScreen(() {
      _iNetworkChangeManger.handleNetworkChange((resultEnum) {
        _updateView(resultEnum);
        // _netWorkResultEnum
      });
    });
  }

  void _updateView(NetWorkResultEnum resultEnum) {
    setState(() {
      _netWorkResultEnum = resultEnum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(microseconds: 200),
      crossFadeState: _netWorkResultEnum == NetWorkResultEnum.off
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      firstChild: Container(
        height: 40,
        color: Colors.red,
        child: const Text(
          "No Network",
          style: TextStyle(fontSize: 15, color: Colors.blue),
        ),
      ),
      secondChild: const SizedBox(),
    );
  }
}

mixin StateMixin<T extends StatefulWidget> on State<T> {
  void waitForScreen(VoidCallback onComplete) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onComplete.call();
    });
  }
}
