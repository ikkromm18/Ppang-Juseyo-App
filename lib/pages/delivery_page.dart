import 'package:flutter/material.dart';

class DeliveryPage extends StatefulWidget {
  const DeliveryPage({super.key});

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
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
        onPressed: () {
          // Action to be performed when the button is pressed
        },
        child: Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
      ),
    );
  }
}
