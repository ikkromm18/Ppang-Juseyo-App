import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage('assets/images/Female_User.png'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Nama Pengguna',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'email@example.com',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profil'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                // Aksi ketika Profil dipencet
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Ubah Kata Sandi'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                // Aksi ketika Ubah Kata Sandi dipencet
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifikasi'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                // Aksi ketika Notifikasi dipencet
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Bantuan'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                // Aksi ketika Bantuan dipencet
              },
            ),
          ],
        ),
      ),
    );
  }
}
