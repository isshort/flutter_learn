import 'package:get_it/get_it.dart';
import 'package:multiple_navigator/modules/basket/data/repo/basket_repo.dart';
import 'package:multiple_navigator/modules/basket/view/logic/product/product_bloc.dart';

import 'bloc/authentication_bloc.dart';
import '../app/router/routes_screen.dart';

final sl = GetIt.instance;
void setup() {
  sl
        ..registerLazySingleton<BasketRepo>(() => BasketRepoImpl())
        ..registerFactory<ProductBloc>(
            () => ProductBloc(basketRepo: sl.get<BasketRepo>()))
        // ..registerFactory<AuthenticationBloc>(() => AuthenticationBloc())
        ..registerLazySingleton<AuthenticationBloc>(() => AuthenticationBloc())
        ..registerFactory<AppRouter>(
            () => AppRouter(sl.get<AuthenticationBloc>()))

      ///
      //
      //
      ///
      ;
}
