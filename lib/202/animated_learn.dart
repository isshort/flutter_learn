import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AnimatedLearn extends StatefulWidget {
  const AnimatedLearn({Key? key}) : super(key: key);

  @override
  State<AnimatedLearn> createState() => _AnimatedLearnState();
}

class _AnimatedLearnState extends State<AnimatedLearn> with TickerProviderStateMixin {
  @override
  void _changeVisible() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  void initState() {
    super.initState();
    controler = AnimationController(vsync: this, duration: _DurationItems.durationLow);
  }

  bool _isVisible = false;
  late AnimationController controler;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // _changeVisible();
          controler.animateTo(_isVisible ? 1 : 0);
        },
      ),
      body: Column(children: [
        ListTile(
          title: AnimatedOpacity(
            duration: _DurationItems.durationLow,
            opacity: _isVisible ? 1 : 0,
            child: const Text('data'),
          ),
          trailing: IconButton(
            onPressed: () {
              _changeVisible();
            },
            icon: const Icon(Icons.precision_manufacturing_rounded),
          ),
        ),
        AnimatedContainer(
          duration: _DurationItems.durationLow,
          color: Colors.red,
          height: _isVisible ? 0 : MediaQuery.of(context).size.width * 0.2,
          width: MediaQuery.of(context).size.width * 0.2,
        ),
        AnimatedIcon(
            icon: _isVisible ? AnimatedIcons.menu_arrow : AnimatedIcons.close_menu,
            progress: controler)
      ]),
    );
  }
}

class _DurationItems {
  static const durationLow = Duration(seconds: 1);
}
