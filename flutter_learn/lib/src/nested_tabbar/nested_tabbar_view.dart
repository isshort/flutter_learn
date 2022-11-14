import 'dart:math';

import 'package:flutter/material.dart';

class NestedTabBarView extends StatefulWidget {
  const NestedTabBarView({Key? key}) : super(key: key);

  @override
  State<NestedTabBarView> createState() => _NestedTabBarViewState();
}

class _NestedTabBarViewState extends State<NestedTabBarView>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nested App Bar'),
      ),
      body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverToBoxAdapter(
                  child: TabBar(
                    controller: _tabController,
                    unselectedLabelColor: Colors.black54,
                    labelColor: Colors.blue,
                    tabs: const <Widget>[
                      Tab(
                        text: 'Menu',
                      ),
                      Tab(
                        text: 'about',
                      ),
                    ],
                  ),
                )
              ],
          body: TabBarView(
            controller: _tabController,
            children: const [
              MenuView(),
              CommentView(),
            ],
          )),
    );
  }
}

class MenuView extends StatefulWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late TabController _tabController;
  int count = 4;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(length: count, vsync: this);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            unselectedLabelColor: Colors.black54,
            labelColor: Colors.blue,
            tabs: [
              ...List.generate(
                  count,
                  (index) => Tab(
                        text: '$index -tab',
                      ))
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: TabBarView(controller: _tabController, children: [
              ...List.generate(
                  count,
                  (index) => Container(
                        color: Colors.primaries[
                            Random().nextInt(Colors.primaries.length)],
                      ))
            ]),
          ),
        ],
      ),
    );
  }
}

class CommentView extends StatelessWidget {
  const CommentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('Comment view text'),
    );
  }
}
