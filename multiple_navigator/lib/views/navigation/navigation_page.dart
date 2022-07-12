import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiple_navigator/views/navigation/cubit/navigation_cubit.dart';
import 'package:multiple_navigator/views/navigation/navigation_screen.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: const NavigationScreen(),
    );
  }
}
