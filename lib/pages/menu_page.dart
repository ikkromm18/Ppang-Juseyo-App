import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'menu_by_category_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class FoodCategory {
  final String id;
  final String name;
  final String image;

  FoodCategory({required this.id, required this.name, required this.image});

  factory FoodCategory.fromJson(Map<String, dynamic> json) {
    return FoodCategory(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}

class _MenuPageState extends State<MenuPage> {
  late Future<List<FoodCategory>> futureCategories;

  @override
  void initState() {
    super.initState();
    futureCategories = fetchFoodCategories();
  }

  Future<List<FoodCategory>> fetchFoodCategories() async {
    final response = await http
        .get(Uri.parse('http://ppangjuseyo.agsa.site/api/category/get'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<FoodCategory> categories =
          data.map((json) => FoodCategory.fromJson(json)).toList();
      return categories;
    } else {
      throw Exception('Failed to load food categories');
    }
  }

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
                          "What Would You Like To Eat",
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

              // Menampilkan data dari API menggunakan FutureBuilder dan GridView.builder
              FutureBuilder<List<FoodCategory>>(
                future: futureCategories,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<FoodCategory> categories = snapshot.data!;
                    return Padding(
                      padding: EdgeInsets.all(10.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio:
                              1, // Adjust the aspect ratio as needed
                        ),
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MenuByCategoryPage(
                                    categoryId: categories[index].id,
                                    categoryName: categories[index].name,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(int.parse('0xffDD8383')),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.network(
                                      categories[index].image,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 25.0,
                                    left: 20.0,
                                    right: 20.0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Center(
                                        child: Text(
                                          categories[index].name.toUpperCase(),
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
                          );
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text("${snapshot.error}"));
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
