class BasketModel {
  final int id;
  final Product product;
  final double quantity;

  BasketModel(this.id, this.product, this.quantity);
}

class Product {
  final int id;
  final String name;
  final int price;

  Product({required this.id, required this.name, required this.price});

  factory Product.fromJson(Map<String, dynamic> json) =>
      Product(id: json['id'], name: json['name'], price: json['price']);
}
