import 'package:finetrashapp/models/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  //produk
  final List<Product> _product = [
    Product(
      name: 'Product 1',
      description: 'Description 1',
      price: 100.0,
      imageUrl: 'assets/image/Product (1).png',
    ),
    Product(
      name: 'Product 2',
      description: 'Description 2',
      price: 200.0,
      imageUrl: 'assets/image/Product (2).png',
    ),
    Product(
      name: 'Product 3',
      description: 'Description 3',
      price: 300.0,
      imageUrl: 'assets/image/Product (3).png',
    ),
    Product(
      name: 'Product 4',
      description: 'Description 4',
      price: 400.0,
      imageUrl: 'assets/image/Product (4).png',
    ),
  ];

  //keranjang
  final List<Product> _keranjang = [];

  //list produk
  List<Product> get products => _product;

  //list keranjang
  List<Product> get cart => _keranjang;

  //tambah produk ke keranjang
  void addToCart(Product item) {
    _keranjang.add(item);
    notifyListeners();
  }

  //hapus produk dari keranjang
  void removeFromCart(Product item) {
    _keranjang.remove(item);
    notifyListeners();
  }
}
