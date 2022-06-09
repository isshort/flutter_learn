import 'package:flutter_learn/src/feature/page_view/cubit/page_view_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setup() async {
  sl.registerFactory<PageViewCubit>(PageViewCubit.new);
}
