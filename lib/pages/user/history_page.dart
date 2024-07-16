import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final List<Map<String, String>> historyItems = [
    {'title': 'Pembelian Item A', 'date': '2023-07-01', 'amount': 'Rp 100.000'},
    {'title': 'Pembelian Item B', 'date': '2023-07-02', 'amount': 'Rp 150.000'},
    {'title': 'Pembelian Item C', 'date': '2023-07-03', 'amount': 'Rp 200.000'},
    // Tambahkan lebih banyak riwayat sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: ListView.builder(
        itemCount: historyItems.length,
        itemBuilder: (context, index) {
          final item = historyItems[index];
          return ListTile(
            title: Text(item['title']!),
            subtitle: Text(item['date']!),
            trailing: Text(item['amount']!),
          );
        },
      ),
    );
  }
}
