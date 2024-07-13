import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MenuByCategoryPage extends StatefulWidget {
  final String categoryId;
  const MenuByCategoryPage({super.key, required this.categoryId});

  @override
  State<MenuByCategoryPage> createState() => _MenuByCategoryPageState();
}

class Product {
  final String id;
  final String product;
  final String price;
  final String qty;
  final String image;

  Product({
    required this.id,
    required this.product,
    required this.price,
    required this.qty,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      product: json['product'],
      price: json['price'],
      qty: json['qty'],
      image: json['image'],
    );
  }
}

class _MenuByCategoryPageState extends State<MenuByCategoryPage> {
  late Future<List<Product>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = fetchProductsByCategory(widget.categoryId);
  }

  Future<List<Product>> fetchProductsByCategory(String categoryId) async {
    final response = await http.get(Uri.parse(
        'https://ppangjuseyo.agsa.site/api/transaction.php?id=$categoryId'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      List<dynamic> productsJson = data['detail'];
      List<Product> products =
          productsJson.map((json) => Product.fromJson(json)).toList();
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products by Category'),
      ),
      body: FutureBuilder<List<Product>>(
        future: futureProducts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Product> products = snapshot.data!;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(products[index].image),
                  title: Text(products[index].product),
                  subtitle: Text(
                      'Price: ${products[index].price} - Qty: ${products[index].qty}'),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
