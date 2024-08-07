import 'package:flutter/material.dart';
import 'package:ppang_juseyo/pages/pesanan_selesai_page.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ppang_juseyo/models/selected_product.dart';

class DeliveryPage extends StatefulWidget {
  final List<SelectedProduct>
      selectedProducts; //tolong perbaiki kode agar SelectedProduct tidak error
  final String paymentMethod;

  const DeliveryPage({
    super.key,
    required this.selectedProducts,
    required this.paymentMethod,
  });

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  Future<void> _completeTransaction() async {
    final url = 'https://ppangjuseyo.agsa.site/api/transaction.php';

    // Menghitung subtotal dari selectedProducts
    double subtotal = widget.selectedProducts.fold(
      0.0,
      (sum, product) =>
          sum +
          (product.qty *
              product
                  .price), // //tolong perbaiki kode agar qty * price tidak error
    );

    final headers = {
      'Content-Type': 'application/json',
    };

    final body = jsonEncode({
      'id': '1',
      'date': '11-07-2024',
      'subtotal': subtotal.toString(),
      'payment': widget.paymentMethod,
      'status': 'Selesai',
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        // Jika server merespons dengan status 200 OK
        print('Transaksi selesai');
        // Navigasi ke halaman Pesanan Selesai
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PesananSelesaiPage(),
          ),
        );
      } else {
        // Jika server merespons dengan status yang berbeda
        print('Gagal menyelesaikan transaksi');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Gagal menyelesaikan transaksi.'),
          ),
        );
      }
    } catch (e) {
      // Menangani kesalahan yang mungkin terjadi
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Terjadi kesalahan.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Center(
              child: Container(
                child: Image.asset(
                  "assets/images/delivery.png",
                  height: 125.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Driver Sedang",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              "Dalam Perjalanan",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 16.0,
                    ),
                    SizedBox(
                      width: 7.0,
                    ),
                    Text("Jefrianto")
                  ],
                ),
                SizedBox(
                  width: 20.0,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.call,
                      size: 16.0,
                    ),
                    SizedBox(
                      width: 7.0,
                    ),
                    Text("0856 9999 5432")
                  ],
                )
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  color: Color(0xffd9d9d9)),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: Image.asset(
                            "assets/images/exampleprofile.png",
                            width: 70.0,
                          ),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                child: Text(
                                  "ANA",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      "4.5",
                                      style: TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.0),
                      child: Row(
                        children: [
                          Container(
                            child: Icon(
                              Icons.access_time_filled,
                              size: 30,
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "Waktu Pengantaran 10.50",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 25.0),
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Text("------------------"),
                      ),
                    ),
                    Divider(),
                    Container(
                      margin: EdgeInsets.only(left: 20.0),
                      child: Row(
                        children: [
                          Icon(Icons.location_city),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text("Lokasi Anda")
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 40.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "images/Menu/brownis.png",
                                      width: 30.0,
                                      fit: BoxFit.cover,
                                    ), //diambil dari selected product
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      "Brownis", //diambil dari selected product
                                      style: TextStyle(fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Rp 45.000", //diambil dari selected product
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffac7c7c),
        onPressed: _completeTransaction,
        child: Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
      ),
    );
  }
}
