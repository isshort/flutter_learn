import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit()
      : pageController = PageController(),
        super(const NavigationState(selectedItem: 0));
  PageController pageController;
  void change(int page) {
    pageController.animateToPage(
      page,
      duration: const Duration(microseconds: 400),
      curve: Curves.ease,
    );
    emit(NavigationState(selectedItem: page));
  }
}
