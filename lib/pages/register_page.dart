import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:ppang_juseyo/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      final response = await http.post(
        Uri.parse('https://ppangjuseyo.agsa.site/api/auth/register.php'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': _nameController.text,
          'email': _emailController.text,
          'phone': _phoneController.text,
          'password': _passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        if (responseData['success']) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${responseData['message']}')),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${responseData['message']}')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Server error: ${response.statusCode}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Set background image using DecorationImage
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          // Center the content horizontally and vertically
          child: SingleChildScrollView(
            child: Column(
              // Arrange widgets vertically
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white.withOpacity(0.7),
                  // Make the container transparent
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 50),
                        Text(
                          "Welcome",
                          style: GoogleFonts.yeonSung(
                            textStyle: TextStyle(fontSize: 36),
                          ),
                        ),
                        Text(
                          "Ppang Juseyo",
                          style: GoogleFonts.yeonSung(
                            textStyle: TextStyle(fontSize: 36),
                          ),
                        ),
                        SizedBox(height: 20),

                        // Name Input Field
                        SizedBox(
                          width: 330.0,
                          height: 60.0,
                          child: TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              labelText: "Name",
                              filled: true,
                              fillColor: Color(0xffF4F1F1),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                        ),

                        SizedBox(height: 20),

                        // Email Input Field
                        SizedBox(
                          width: 330.0,
                          height: 60.0,
                          child: TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: "Email",
                              filled: true,
                              fillColor: Color(0xffF4F1F1),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                          ),
                        ),

                        SizedBox(height: 20),

                        // Phone Input Field
                        SizedBox(
                          width: 330.0,
                          height: 60.0,
                          child: TextFormField(
                            controller: _phoneController,
                            decoration: InputDecoration(
                              labelText: "Phone",
                              filled: true,
                              fillColor: Color(0xffF4F1F1),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your phone number';
                              }
                              return null;
                            },
                          ),
                        ),

                        SizedBox(height: 20),

                        // Password Input Field
                        SizedBox(
                          width: 330.0,
                          height: 60.0,
                          child: TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelText: "Password",
                              filled: true,
                              fillColor: Color(0xffF4F1F1),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                        ),

                        SizedBox(height: 20),

                        ElevatedButton(
                          onPressed: _register,
                          child: const Text(
                            'Register',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(330, 30),
                            backgroundColor: Color(0xffd9d9d9),
                          ),
                        ),

                        SizedBox(height: 50),

                        Center(
                          child: Text(
                            "OR",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),

                        SizedBox(height: 40),

                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Sudah punya akun? ',
                                style: TextStyle(fontWeight: FontWeight.normal),
                              ),
                              WidgetSpan(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginPage(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black, // Link color
                                      decoration: TextDecoration
                                          .underline, // Underline decoration
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
