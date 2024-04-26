import 'package:exam_e_commerce/Cart_page/cart_screen.dart';
import 'package:exam_e_commerce/HomePage/Home_Screen.dart';
import 'package:exam_e_commerce/detial%20page/detilas_page.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context) => HomeScreen(),
        '/detail' : (context) => DetailScreen(),
        '/cart' : (context) => CartScreen(),
      },
    );
  }
}
