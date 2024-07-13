import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/logo1.png',
                      width: 40.0,
                      height: 50.0,
                    ),
                    SizedBox(width: 20.0),
                    Text(
                      'Ppang Juseyo',
                      style: GoogleFonts.yeonSung(
                        textStyle: TextStyle(fontSize: 24),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade200,
                        ),
                        child: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                        // Handle user icon tap event
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      alignment: Alignment.center,
                      height: 140.0,
                      color: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "What Would Your Like To Eat",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset(
                        "images/awalan1.png",
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 150.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Discovered By Category",
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 180.0,
                              decoration: BoxDecoration(
                                color: Color(int.parse('0xffDD8383')),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      "images/Menu/donut.png",
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 25.0,
                                    left: 50.0,
                                    child: Container(
                                      width: 100.0,
                                      height: 25.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "DONUT",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 180.0,
                              decoration: BoxDecoration(
                                color: Color(int.parse('0xffDD8383')),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 180.0,
                              decoration: BoxDecoration(
                                color: Color(int.parse('0xffDD8383')),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 180.0,
                              decoration: BoxDecoration(
                                color: Color(int.parse('0xffDD8383')),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
