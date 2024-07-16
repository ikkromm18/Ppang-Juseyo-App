import 'package:flutter/material.dart';

class DiantarPage extends StatelessWidget {
  const DiantarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Diantar"),
      ),
      body: Center(
        child: Text(
          "Tidak Ada Data",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
