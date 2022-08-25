part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductAdd extends ProductState {}

class ProductListState extends ProductState {
  final List<Product> productList;

  const ProductListState(this.productList);

  @override
  List<Object> get props => [productList];
}
