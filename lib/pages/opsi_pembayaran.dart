import 'package:flutter/material.dart';
import 'package:ppang_juseyo/models/selected_product.dart'; // Pastikan model ini diimpor dengan benar
import 'package:ppang_juseyo/pages/delivery_page.dart';

class OpsiPembayaranPage extends StatefulWidget {
  final List<SelectedProduct> selectedProducts;

  const OpsiPembayaranPage({super.key, required this.selectedProducts});

  @override
  State<OpsiPembayaranPage> createState() => _OpsiPembayaranPageState();
}

class _OpsiPembayaranPageState extends State<OpsiPembayaranPage> {
  String? _selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Opsi Pembayaran"),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Container(
                child: Image.asset(
                  "assets/images/logo1.png",
                  height: 125.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                "Opsi Pembayaran",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                "Metode Pembayaran",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  RadioListTile<String>(
                    title: Row(
                      children: [
                        Icon(Icons.money),
                        SizedBox(width: 25.0),
                        Text(
                          "Cash On Delivery",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    value: 'COD',
                    groupValue: _selectedPaymentMethod,
                    onChanged: (value) {
                      setState(() {
                        _selectedPaymentMethod = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Row(
                      children: [
                        Image.asset(
                          "assets/images/dana.png",
                          width: 30.0,
                        ),
                        SizedBox(width: 20.0),
                        Text(
                          "DANA",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    value: 'DANA',
                    groupValue: _selectedPaymentMethod,
                    onChanged: (value) {
                      setState(() {
                        _selectedPaymentMethod = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_selectedPaymentMethod != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DeliveryPage(
                          selectedProducts: widget.selectedProducts,
                          paymentMethod: _selectedPaymentMethod!,
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Silakan pilih metode pembayaran')));
                  }
                },
                child: Text(
                  'Selanjutnya',
                  style: TextStyle(color: Colors.white),
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
      ),
    );
  }
}
