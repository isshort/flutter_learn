import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiple_navigator/app/router/destination.dart';
import 'package:multiple_navigator/views/basket/basket_screen.dart';
import 'package:multiple_navigator/views/home/home_screen.dart';
import 'package:multiple_navigator/views/navigation/cubit/navigation_cubit.dart';
import 'package:multiple_navigator/views/profile/profile_screen.dart';
import 'package:multiple_navigator/views/search/search_screen.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: context.read<NavigationCubit>().pageController,
        // onPageChanged: context.read<NavigationCubit>().change(page),
        children: const [
          HomeScreen(),
          SearchScreen(),
          BasketScreen(),
          ProfileScreen(),
        ],
      ),
      // bottomNavigationBar: NavigationBar(destinations: destinations,),
      // bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
      //   builder: (context, state) {
      //     return BottomNavigationBar(
      //       selectedFontSize: 16,
      //       showUnselectedLabels: true,
      //       items: [
      //         _buildNavigationBar(Icons.home, 'home'),
      //         _buildNavigationBar(Icons.search, 'search'),
      //         _buildNavigationBar(Icons.shopping_basket_sharp, 'basket'),
      //         _buildNavigationBar(Icons.person, 'profile'),
      //       ],
      //       onTap: (value) => context.read<NavigationCubit>().change(value),
      //       currentIndex: state.selectedItem,
      //     );
      //   },
      // ),
    );
  }

  BottomNavigationBarItem _buildNavigationBar(IconData icon, String label) =>
      BottomNavigationBarItem(
          icon: Icon(icon), label: label, backgroundColor: Colors.green);
}
