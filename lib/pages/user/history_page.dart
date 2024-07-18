import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<Map<String, String>> historyItems = [];

  @override
  void initState() {
    super.initState();
    fetchHistory();
  }

  Future<void> fetchHistory() async {
    // enpoint get all product menyimpan cache dan tidak bisa direfress secara otomatis
    // fungsi ini dibuat untuk menambahkan random parameter di endpoint get
    // sehingga fungsinya seperti mengganti url endpoint tapi fungsinya sama
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();
    String getRandomString(int length) =>
        String.fromCharCodes(Iterable.generate(
            length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
    String random = getRandomString(5);

    final response = await http.get(
      Uri.parse('https://ppangjuseyo.agsa.site/api/transaction.php?$random'),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      setState(() {
        historyItems = data.map((item) {
          return {
            'id': item['id'].toString(),
            'date': item['date'].toString(),
            'subtotal': item['subtotal'].toString(),
            'payment': item['payment'].toString(),
            'status': item['status'].toString(),
          };
        }).toList();
      });
    } else {
      // Error handling
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load history data')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: historyItems.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: historyItems.length,
              itemBuilder: (context, index) {
                final item = historyItems[index];
                return ListTile(
                  title: Text('Transaction ID: ${item['id']}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Date: ${item['date']}'),
                      Text('Payment: ${item['payment']}'),
                      Text('Status: ${item['status']}'),
                    ],
                  ),
                  trailing: Text('Rp ${item['subtotal']}'),
                );
              },
            ),
    );
  }
}
