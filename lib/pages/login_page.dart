import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

import 'package:ppang_juseyo/pages/menu_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Set background image using DecorationImage
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/bg1.jpg"), fit: BoxFit.cover)),
        child: Center(
          // Center the content horizontally and vertically
          child: Column(
            // Arrange widgets vertically
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.white
                    .withOpacity(0.7), // Make the container transparent
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Welcome",
                      style: GoogleFonts.yeonSung(
                          textStyle: TextStyle(fontSize: 36)),
                    ),
                    Text(
                      "Ppang Juseyo",
                      style: GoogleFonts.yeonSung(
                        textStyle: TextStyle(fontSize: 36),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),

                    // Username Input Field
                    SizedBox(
                      width: 330.0,
                      height: 60.0, // Set width to 200 pixels
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Email / Number Phone",
                          filled: true,
                          fillColor: Color(int.parse('0xffF4F1F1')),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide:
                                BorderSide.none, // Set the radius to 15 pixels
                          ),
                        ),
                        onChanged: (value) {
                          // Update username when the text changes
                          setState(() {
                            username = value;
                          });
                        },
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    // Password Input Field
                    SizedBox(
                      width: 330.0,
                      height: 60.0,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Password",
                          filled: true,
                          fillColor: Color(int.parse('0xffF4F1F1')),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide:
                                BorderSide.none, // Set the radius to 15 pixels
                          ),
                        ),
                        obscureText: true, // Hide password characters
                        onChanged: (value) {
                          // Update password when the text changes
                          setState(() {
                            password = value;
                          });
                        },
                      ),
                    ),

                    SizedBox(
                      height: 100.0,
                    ),

                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MenuPage()),
                          );
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(330, 30),
                            backgroundColor: Color(int.parse('0xffd9d9d9')))),
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Text(
                        "OR",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Belum punya akun? ',
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                          TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // Link color
                              decoration: TextDecoration
                                  .underline, // Underline decoration
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Add spacing between containers (optional)
            ],
          ),
        ),
      ),
    );
  }
}
