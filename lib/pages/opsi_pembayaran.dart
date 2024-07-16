import 'package:flutter/material.dart';
import 'package:ppang_juseyo/pages/delivery_page.dart';

class OpsiPembayaranPage extends StatefulWidget {
  const OpsiPembayaranPage({super.key});

  @override
  State<OpsiPembayaranPage> createState() => _OpsiPembayaranPageState();
}

class _OpsiPembayaranPageState extends State<OpsiPembayaranPage> {
  String? _selectedPaymentMethod;

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
                    value: 'cod',
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
                          "Dana",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    value: 'dana',
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
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_selectedPaymentMethod != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DeliveryPage(),
                      ),
                    );
                  } else {
                    // Tampilkan pesan jika metode pembayaran belum dipilih
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Silakan pilih metode pembayaran.'),
                      ),
                    );
                  }
                },
                child: Text(
                  'Bayar Sekarang',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
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
