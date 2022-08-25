import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:multiple_navigator/modules/basket/data/model/basket_model.dart';
import 'package:multiple_navigator/modules/basket/data/repo/basket_repo.dart';

void main() {
  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();
  });
  test('Product  Test', () async {
    final response = await rootBundle.loadString(AssetsName.product.fromJson);
    final data = await json.decode(response) as List;

    final result = data
        .map<Product>((e) => Product.fromJson(e as Map<String, dynamic>))
        .toList();

    expect(result, isA<List<Product>>());
  });
}
