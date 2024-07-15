import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppang_juseyo/pages/login_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Set background image using DecorationImage
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg1.jpg"), fit: BoxFit.cover)),
        child: Center(
          // Center the content horizontally and vertically
          child: Column(
            // Arrange widgets vertically
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 550,
                width: 350,
                color: Colors.white
                    .withOpacity(0.7), // Make the container transparent
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
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
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(300, 40),
                            backgroundColor: Color(int.parse('0xffd9d9d9')))),
                    SizedBox(
                      height: 220,
                    ),
                    Center(
                      child: Text(
                        "Jika anda mendaftar atau login, anda menyetujui syarat dan ketentuan ini",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 10,
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
