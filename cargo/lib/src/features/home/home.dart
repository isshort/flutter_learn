import 'package:cargo/src/core/constants/colors.dart';
import 'package:cargo/src/features/home/search.dart';
import 'package:cargo/src/features/widgets/grid_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with ColorsConstant {
  late PageController controller;
  @override
  void initState() {
    super.initState();
    controller = PageController(keepPage: true);
  }

  int currentIndex = 0;
  void updateIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  void updateIndexBottom(index) {
    setState(() {
      currentIndex = index;
      controller.animateToPage(index, duration: const Duration(microseconds: 100), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "cargo works",
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.tune,
                semanticLabel: 'filter',
              ))
        ],
      ),
      body: PageView(
        controller: controller,
        onPageChanged: updateIndex,
        children: const [
          Search(color: Colors.red),
          Search(color: Colors.blue),
          Search(color: Colors.green),
          Search(color: Colors.blueAccent),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(currentIndex: currentIndex, onTap: updateIndexBottom, items: [
        _buildBottomNavigationBar(Icons.menu, 'Menu'),
        _buildBottomNavigationBar(Icons.search, 'Search'),
        _buildBottomNavigationBar(Icons.favorite, 'Favorite'),
        _buildBottomNavigationBar(Icons.person, 'User'),
      ]),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBar(IconData icon, String lable) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: witchHaze,
      ),
      label: lable,
      activeIcon: Icon(icon, color: bajeWhite),
    );
  }
}
