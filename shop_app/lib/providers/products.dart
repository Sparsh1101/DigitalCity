// ignore_for_file: sdk_version_ui_as_code

import 'package:flutter/material.dart';

import './product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Oneplus 9',
      description: 'Latest Phone from Oneplus!',
      price: 799.99,
      imageUrl: 'https://m.media-amazon.com/images/I/61fy+u9uqPL._SX679_.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Samsung Galaxy S21 Ultra',
      description: 'Latest Phone from Samsung!',
      price: 1199.99,
      imageUrl: 'https://m.media-amazon.com/images/I/917nPCOw9-L._SX569_.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Apple Iphone 13 Pro Max',
      description: 'Latest Pro Phone from Apple!',
      price: 1099.99,
      imageUrl: 'https://m.media-amazon.com/images/I/619m8rLBQSL._SX679_.jpg',
    ),
    Product(
      id: 'p4',
      title: 'Apple Iphone 13 Pro',
      description: 'Latest Phone from Apple!',
      price: 999.99,
      imageUrl: 'https://m.media-amazon.com/images/I/61sDyXAepuL._SX679_.jpg',
    ),
  ];

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }
}
