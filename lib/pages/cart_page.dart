import 'package:finetrashapp/component/drawer.dart';
import 'package:finetrashapp/models/product.dart';
import 'package:finetrashapp/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Keranjang extends StatelessWidget {
  const Keranjang({super.key});
  //fungsi untuk menghapus produk dari keranjang
  void removeFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: const Text(
            'Apakah anda yakin ingin menghapus produk ini dari keranjang?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.read<Shop>().removeFromCart(product);
                Navigator.pop(context);
              },
              child: Text('Ya', style: TextStyle(color: Colors.grey[600])),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Tidak', style: TextStyle(color: Colors.grey[600])),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //akses data dari keranjang
    final keranjang = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [IconButton(icon: Icon(Icons.chat), onPressed: () {})],
        title: Text('Keranjang'),
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          //list produk
          Expanded(
            child:
                keranjang.isEmpty
                    ? Center(child: Text('Keranjang Kosong...'))
                    : ListView.builder(
                      padding: const EdgeInsets.all(20),
                      itemCount: keranjang.length,
                      itemBuilder: (context, index) {
                        //get data produk
                        final item = keranjang[index];

                        //return list produk
                        return ListTile(
                          title: Text(item.name),
                          subtitle: Text('Rp. ${item.price}'),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              context.read<Shop>().removeFromCart(item);
                            },
                          ),
                        );
                      },
                    ),
          ),

          //bayar
        ],
      ),
    );
  }
}
