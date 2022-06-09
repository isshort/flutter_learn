import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learn/src/core/locator/service_locator.dart';
import 'package:flutter_learn/src/feature/page_view/cubit/page_view_cubit.dart';

import 'page_view_screen.dart';

class PageViewCheck extends StatelessWidget {
  const PageViewCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<PageViewCubit>(),
      child: const PageViewScreen(),
    );
  }
}
