import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho de Compras'),
      ),
      body: Center(
        child: Text(
          'Conteúdo do Carrinho de Compras aqui',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
