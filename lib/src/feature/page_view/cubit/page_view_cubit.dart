import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'page_view_state.dart';

class PageViewCubit extends Cubit<PageViewState> {
  PageViewCubit()
      : controller = PageController(),
        super(const PageViewState(pageIndex: 0));

  final PageController controller;

  Future<void> changePage(index) async {
    print('your index is $index');
    await controller.animateToPage(
      index,
      duration: const Duration(microseconds: 400),
      curve: Curves.ease,
    );
    emit(PageViewState(pageIndex: index));
  }
}
