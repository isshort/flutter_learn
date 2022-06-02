import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TabBarLearn extends StatefulWidget {
  const TabBarLearn({Key? key}) : super(key: key);

  @override
  State<TabBarLearn> createState() => _TabBarLearnState();
}

class _TabBarLearnState extends State<TabBarLearn> with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _MyTabsView.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _MyTabsView.values.length,
        child: Scaffold(
          extendBody: true,
          // appBar: AppBar(
          //   bottom: const TabBar(tabs: [
          //     Tab(
          //       text: 'Page1',
          //     ),
          //     Tab(
          //       text: 'Page2',
          //     ),
          //   ]),
          // ),
          body: TabBarView(controller: _tabController, children: [
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.blue,
            ),
          ]),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _tabController.animateTo(1);
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
              notchMargin: 10,
              child: TabBar(
                enableFeedback: true,
                controller: _tabController,
                tabs: _MyTabsView.values
                    .map((e) => Tab(
                          text: '${e.name}',
                        ))
                    .toList(),
              )),
        ));
  }
}

enum _MyTabsView { home, settings, favorite, profile }

extension _MyTabsViewExtenstion on _MyTabsView {
  void name1(args) {}
}
