import 'package:flutter/material.dart';
import 'package:ppang_juseyo/pages/menu_page.dart';

class PesananSelesaiPage extends StatefulWidget {
  const PesananSelesaiPage({super.key});

  @override
  State<PesananSelesaiPage> createState() => _PesananSelesaiPageState();
}

class _PesananSelesaiPageState extends State<PesananSelesaiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
              height: 30.0,
            ),
            Container(
              child: Text(
                "Pesanan Selesai",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              width: 150.0,
              height: 150.0,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.green),
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 100.0,
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MenuPage(),
                    ),
                  );
                },
                child: Text(
                  "Selesai",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffac7c7c),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              child: Text(
                "Thank You For Order",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              ),
            )
          ],
        ),
      ),
    );
  }
}
