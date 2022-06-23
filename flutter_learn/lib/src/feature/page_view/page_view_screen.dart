import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/page_view_cubit.dart';
import 'widgets/page1.dart';
import 'widgets/page2.dart';

class PageViewScreen extends StatelessWidget {
  const PageViewScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          controller: context.read<PageViewCubit>().controller,
          onPageChanged: (index) => context.read<PageViewCubit>().changePage(index),
          children: const [
            Page1(),
            Page2(),
            Page1(),
            Page2(),
          ]),
      bottomNavigationBar: BlocBuilder<PageViewCubit, PageViewState>(
        builder: (context, state) {
          return BottomNavigationBar(
            selectedItemColor: Colors.yellow,
            currentIndex: context.read<PageViewCubit>().state.pageIndex,
            onTap: (value) {
              context.read<PageViewCubit>().changePage(value);
            },
            items: [
              buildNavigationBarItem(label: 'menu', iconData: Icons.menu),
              buildNavigationBarItem(label: 'search', iconData: Icons.search),
              buildNavigationBarItem(label: 'location', iconData: Icons.location_on),
              buildNavigationBarItem(label: 'profile', iconData: Icons.person),
            ],
          );
        },
      ),
    );
  }

  BottomNavigationBarItem buildNavigationBarItem({required String label, required IconData iconData}) {
    return BottomNavigationBarItem(
        backgroundColor: Colors.green,
        label: label,
        activeIcon: Icon(
          iconData,
          color: Colors.red,
        ),
        icon: Icon(iconData));
  }
}
