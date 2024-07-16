import 'package:flutter/material.dart';
import 'account_page.dart';
import 'history_page.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Color(0xffd9d9d9)),
            child: Row(
              children: [
                Container(
                  width: 130.0,
                  height: 130.0,
                  decoration: BoxDecoration(color: Color(0xffac7c7c)),
                  child: Image.asset(
                    "assets/images/Female_User.png",
                    width: 100.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 130.0,
                  child: Text(
                    " USER",
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Container(
                      child: Icon(
                        Icons.article,
                        size: 40,
                      ),
                    )),
                SizedBox(
                  width: 15.0,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Container(
                      child: Icon(Icons.discount, size: 40),
                    )),
                SizedBox(
                  width: 15.0,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Container(
                      child: Icon(Icons.person, size: 40),
                    )),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 10.0,
            color: Colors.black,
          ),
          SizedBox(
            height: 20.0,
          ),
          ListTile(
            title: Text(
              "Account",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccountPage()),
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              "Diantar",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text(
              "History",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HistoryPage()),
              );
            },
          ),
          Divider(),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Log Out',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffac7c7c),
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'kembali',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      ),
    );
  }
}
