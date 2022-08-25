part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class ProductListEvent extends ProductEvent {}

class ProductAddEvent extends ProductEvent {
  final Product product;

  const ProductAddEvent(this.product);
  @override
  List<Object> get props => [product];
}
