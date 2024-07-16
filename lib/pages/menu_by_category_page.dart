import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';
import 'package:ppang_juseyo/pages/transaksi_page.dart';
import 'package:ppang_juseyo/models/selected_product.dart';

class MenuByCategoryPage extends StatefulWidget {
  final String categoryId;
  final String categoryName;

  const MenuByCategoryPage(
      {super.key, required this.categoryId, required this.categoryName});

  @override
  State<MenuByCategoryPage> createState() => _MenuByCategoryPageState();
}

class Product {
  final String id;
  final String name;
  final double price;
  final int qty;
  final String image;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.qty,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      price: json['price'] != null ? double.parse(json['price']) : 0.0,
      qty: Random().nextInt(100) + 1,
      image: json['image'] ?? '',
    );
  }
}

class _MenuByCategoryPageState extends State<MenuByCategoryPage> {
  late Future<List<Product>> futureProducts;
  List<int> productCounts = [];

  @override
  void initState() {
    super.initState();
    futureProducts = fetchProductsByCategory(widget.categoryId);
    futureProducts.then((products) {
      setState(() {
        productCounts = List.filled(products.length, 1);
      });
    });
  }

  Future<List<Product>> fetchProductsByCategory(String categoryId) async {
    final response = await http.get(Uri.parse(
        'https://ppangjuseyo.agsa.site/api/product/get?category=$categoryId'));

    if (response.statusCode == 200) {
      List<dynamic> productsJson = json.decode(response.body);
      List<Product> products =
          productsJson.map((json) => Product.fromJson(json)).toList();
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }

  void _incrementCount(int index) {
    setState(() {
      productCounts[index]++;
    });
  }

  void _decrementCount(int index) {
    if (productCounts[index] > 0) {
      setState(() {
        productCounts[index]--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Container(
            color: Color(0xffdd9090),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.categoryName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          FutureBuilder<List<Product>>(
            future: futureProducts,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Product> products = snapshot.data!;
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.48,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: Image.network(
                                            products[index].image,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              // Fallback widget if image loading fails
                                              return Icon(Icons.error);
                                            },
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10.0),
                                      Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              products[index].name,
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            SizedBox(height: 4.0),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.star,
                                                    color: Colors.yellow),
                                                SizedBox(width: 5.0),
                                                Text("4.5"),
                                                SizedBox(width: 20.0),
                                                Icon(Icons.inventory),
                                                SizedBox(width: 5.0),
                                                Text(products[index]
                                                    .qty
                                                    .toString()),
                                              ],
                                            ),
                                            SizedBox(height: 4.0),
                                            Text(
                                              "Rp ${products[index].price},-",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(height: 4.0),
                                            Container(
                                              height: 25.0,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.33,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                color: Color(0xffAC7C7C),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () =>
                                                        _decrementCount(index),
                                                    child: Container(
                                                      width: 25,
                                                      height: 25,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Icon(
                                                        Icons.remove,
                                                        size: 14,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 30.0,
                                                    height: 30.0,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        "${productCounts[index]}",
                                                      ),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () =>
                                                        _incrementCount(index),
                                                    child: Container(
                                                      width: 25,
                                                      height: 25,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Icon(
                                                        Icons.add,
                                                        size: 14,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                        ],
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Center(child: Text("${snapshot.error}"));
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                List<SelectedProduct> selectedProducts = [];
                futureProducts.then((products) {
                  for (int i = 0; i < products.length; i++) {
                    if (productCounts[i] > 0) {
                      selectedProducts.add(
                        SelectedProduct(
                          image: products[i].image,
                          product: products[i].name,
                          qty: productCounts[i],
                          price: products[i].price,
                        ),
                      );
                    }
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TransaksiPage(
                        selectedProducts: selectedProducts,
                      ),
                    ),
                  );
                });
              },
              child: Text(
                'Buy Now',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffac7c7c),
                padding: EdgeInsets.symmetric(vertical: 15.0),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
