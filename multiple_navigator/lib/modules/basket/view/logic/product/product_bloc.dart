import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:multiple_navigator/modules/basket/data/model/basket_model.dart';
import 'package:multiple_navigator/modules/basket/data/repo/basket_repo.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final BasketRepo basketRepo;
  ProductBloc({required this.basketRepo}) : super(ProductInitial()) {
    on<ProductEvent>((event, emit) async {});
    on<ProductAddEvent>(
      (event, emit) {},
    );
    on<ProductListEvent>((event, emit) async {
      final result = await basketRepo.getProduct();
      emit(ProductListState(result));
    });
  }
}
/// locator