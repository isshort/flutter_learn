import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:multiple_navigator/modules/basket/data/model/basket_model.dart';

abstract class BasketRepo {
  Future<List<Product>> getProduct();
}

class BasketRepoImpl extends BasketRepo {
  @override
  Future<List<Product>> getProduct() async {
    final response = await rootBundle.loadString(AssetsName.product.fromJson);
    final data = await json.decode(response);
    final result = data
        .map<Product>((e) => Product.fromJson(e as Map<String, dynamic>))
        .toList();

    return result;
  }
}

enum AssetsName {
  product('product');

  final String name;
  const AssetsName(this.name);

  String get fromJson => 'assets/$name.json';
}
