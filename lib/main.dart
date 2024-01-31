// main.dart
import 'package:acai_store/models/product.dart';
import 'package:acai_store/views/menu.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Açaí Shop',
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        brightness: Brightness.light,
      ),
      home: MenuPage(
        products: [
          Product(name: 'Milkshake de Açaí', price: 15.0),
          Product(name: 'Suco de Açaí', price: 20.0),
          Product(name: 'Catuçaí', price: 30.0),
          // Adicione mais purodutos conforme necessário
        ],
      ),
    );
  }
}
