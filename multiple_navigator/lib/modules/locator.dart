import 'package:get_it/get_it.dart';
import 'package:multiple_navigator/modules/basket/data/repo/basket_repo.dart';
import 'package:multiple_navigator/modules/basket/view/logic/product/product_bloc.dart';

final sl = GetIt.instance;
void setup() {
  sl
        ..registerLazySingleton<BasketRepo>(() => BasketRepoImpl())
        ..registerFactory<ProductBloc>(
            () => ProductBloc(basketRepo: sl.get<BasketRepo>()))

      ///
      //
      //
      ///
      ;
}
