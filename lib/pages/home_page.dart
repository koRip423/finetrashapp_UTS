// ignore_for_file: unused_local_variable

import 'package:finetrashapp/component/drawer.dart';
import 'package:finetrashapp/component/list_product.dart';
import 'package:finetrashapp/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //akses data dari product
    final product = context.watch<Shop>().products;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/keranjang');
            },
          ),
        ],
        title: Text('Finetrash'),
      ),
      drawer: MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView(
        children: [
          SizedBox(height: 25),
          //subtitle
          Center(
            child: Text(
              'Selamat datang di Finetrash',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          //produk
          SizedBox(
            height: 600,
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              scrollDirection: Axis.horizontal,
              itemCount: product.length,
              itemBuilder: (context, index) {
                //get data produk
                final item = product[index];

                //return list produk
                return ListProduct(product: product[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
